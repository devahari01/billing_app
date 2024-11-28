from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import asyncio
from .utils import send_mail_async
from .models import Customer, Product, Purchase,Denomination
from django.template.loader import render_to_string
from django.utils.html import strip_tags


def home(request):
    denominations = Denomination.objects.all() #[500, 100, 50, 20, 10, 5, 2, 1]
    return render(request, 'billing/home.html', {"denominations": denominations})

def create_invoice(request):
    return render(request, 'billing/invoice.html', {"message": "Create an Invoice!"})

# @csrf_exempt  # This is optional if CSRF protection is not needed for this view
# def generate_bill(request):
#     if request.method == "POST":
#         # Get customer email
#         customer_email = request.POST.get("customer_email")
#         subject = "Your Bill Details"
#         message = "Thank you for your purchase. Here are your bill details: ..."
#         # asyncio.run(send_mail_async(subject, message, [customer_email]))
#         products = request.POST.getlist("products[]")
#         quantities = request.POST.getlist("quantity[]")

#         # Get the denominations entered by the user
#         denominations = {key: value for key, value in request.POST.items() if key.startswith("denominations[")}
#         denominations = {key: value for key, value in denominations.items() if value}
        
#         # Get the cash paid by the customer
#         cash_paid = request.POST.get("cash_paid")

#         # Validate the data
#         if not customer_email or not products or not quantities:
#             return JsonResponse({"error": "Invalid form submission"}, status=400)

#         # Process the data
#         # For example, calculate the total bill, store in database, etc.
#         bill_data = {
#             "customer_email": customer_email,
#             "items": [{"product_id": p, "quantity": q} for p, q in zip(products, quantities)],
#             "denominations": denominations,
#             "cash_paid": cash_paid,
#         }

#         # Print or save the bill data (example)
#         print("Bill Data:", bill_data)

#         # Respond with a success message
#         return JsonResponse({"message": "Bill generated successfully", "bill_data": bill_data})

#     # If not POST, return error response
#     return JsonResponse({"error": "Invalid request method"}, status=405)
def calculate_change(change, denominations_available):
    """
    Calculates the change to be given to the customer in available denominations.
    Returns a dictionary of denomination counts.
    """
    print(denominations_available.keys())
    change_distribution = {}
    for denomination in sorted(denominations_available.keys(), reverse=True):
        count = 0
        while change >= denomination and denominations_available[denomination] > 0:
            change -= denomination
            denominations_available[denomination] -= 1
            count += 1
        if count > 0:
            change_distribution[denomination] = count

    # If change cannot be fully distributed, raise an error
    if change > 0:
        raise ValueError("Insufficient denominations to provide exact change.")

    return change_distribution
@csrf_exempt
def generate_bill(request):
    if request.method == "POST":
        # Get the customer email, product list, and quantities
        customer_email = request.POST.get("customer_email")
        subject = "Your Bill Details"
        
        products = request.POST.getlist("products[]")
        quantities = request.POST.getlist("quantity[]")
        cash_paid = request.POST.get("cash_paid")

        # Collect denominations from the form
        denominations_available = {
            int(key.replace("denominations[", "").replace("]", "")): int(value)
            for key, value in request.POST.items()
            if key.startswith("denominations[") and value
        }

        # Validate the required fields
        if not customer_email or not products or not quantities or not cash_paid:
            return JsonResponse({"error": "Invalid form submission"}, status=400)

        try:
            cash_paid = float(cash_paid)
        except ValueError:
            return JsonResponse({"error": "Invalid cash_paid value"}, status=400)

        # Check if customer exists or create a new one
        customer, created = Customer.objects.get_or_create(email=customer_email)

        # Initialize totals
        total_price_without_tax = 0
        total_tax_payable = 0
        product_details = []

        # Calculate details for each product
        for product_id, quantity in zip(products, quantities):
            try:
                product = Product.objects.get(product_id=product_id)
                quantity = int(quantity)

                # Calculate prices and taxes
                purchase_price = product.price_per_unit * quantity
                tax_payable = purchase_price * (product.tax_percentage / 100)
                total_price = purchase_price + tax_payable

                # Add to totals
                total_price_without_tax += purchase_price
                total_tax_payable += tax_payable

                # Append itemized details
                product_details.append({
                    "product_id": product_id,
                    "unit_price": product.price_per_unit,
                    "quantity": quantity,
                    "purchase_price": purchase_price,
                    "tax_percentage": product.tax_percentage,
                    "tax_payable": tax_payable,
                    "total_price": total_price,
                })
            except Product.DoesNotExist:
                return JsonResponse({"error": f"Product with ID {product_id} not found"}, status=404)

        # Calculate final totals
        net_price = total_price_without_tax + total_tax_payable
        rounded_net_price = round(net_price, 2)
        balance_payable = cash_paid - rounded_net_price

        # If balance is negative, return error
        if balance_payable < 0:
            return JsonResponse({"error": "Insufficient cash paid by the customer."}, status=400)

        # Calculate the change distribution
        try:
            change_distribution = calculate_change(balance_payable, denominations_available)
        except ValueError as e:
            return JsonResponse({"error": str(e)}, status=400)

        # Save purchase record
        purchase = Purchase.objects.create(
            customer=customer,
            products=product_details,
            total_amount=rounded_net_price,
            tax_amount=total_tax_payable,
        )

        # Prepare context for rendering invoice
        context = {
            "customer_email": customer.email,
            "products": product_details,
            "total_without_tax": round(total_price_without_tax, 2),
            "total_tax": round(total_tax_payable, 2),
            "net_price": rounded_net_price,
            "rounded_price": rounded_net_price,
            "balance": round(balance_payable, 2),
            "balance_denomination": change_distribution,
        }
        # message = "Thank you for your purchase. Here are your bill details: ..."
        html_message = render_to_string('billing/email_invoice.html', context)
        message = strip_tags(html_message)
        asyncio.run(send_mail_async(subject, message, [customer_email]))
        return render(request, "billing/invoice.html", context)

    return JsonResponse({"error": "Invalid request method"}, status=405)
def products_page(request):
    # Fetch all products from the database
    products = Product.objects.all()
    return render(request, 'billing/products_page.html', {'products': products})
def purchases_page(request):
    # Fetch all purchases from the database, ordered by date (most recent first)
    purchases = Purchase.objects.all().order_by('-date')
    
    # Process products for each purchase
    for purchase in purchases:
        product_data = purchase.get_product_data()
        purchase.product_data = product_data  # Add the deserialized product data to the context
    
    return render(request, 'billing/purchases_page.html', {'purchases': purchases})
