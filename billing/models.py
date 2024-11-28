from django.db import models
import json


class Product(models.Model):
    name = models.CharField(max_length=255) 
    product_id = models.CharField(max_length=100, unique=True)
    available_stocks = models.PositiveIntegerField()  
    price_per_unit = models.FloatField()  
    tax_percentage = models.FloatField()  

    def __str__(self):
        return f"{self.name} ({self.product_id})"

class Customer(models.Model):
    email = models.EmailField(unique=True)

    def __str__(self):
        return self.email

class Purchase(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    products = models.JSONField()  # This field stores the JSON data as a dictionary/list
    total_amount = models.FloatField()
    tax_amount = models.FloatField()
    date = models.DateTimeField(auto_now_add=True)
    
    def set_product_data(self, data):
        """Save Python dict as JSON in the products field."""
        if not isinstance(data, (dict, list)):  # Validate that data is a valid JSON serializable type
            raise ValidationError("Invalid data format for products.")
        self.products = data
        self.save()  # Save the model with the updated product data

    def get_product_data(self):
        """Retrieve product data from the products field (automatically deserialized)."""
        return self.products if self.products else []

    def __str__(self):
        return f"Purchase by {self.customer.email} on {self.date}"

class Denomination(models.Model):
    value = models.PositiveIntegerField(unique=True)  # Denomination value (e.g., 500, 200, 100, etc.)
    count = models.PositiveIntegerField(default=0)    # Number of notes/coins available

    def __str__(self):
        return f"{self.value}: {self.count}"