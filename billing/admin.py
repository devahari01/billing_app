from django.contrib import admin
from .models import Product, Customer,Purchase,Denomination


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'product_id', 'available_stocks', 'price_per_unit', 'tax_percentage')  
    search_fields = ('name', 'product_id')  
    list_filter = ('price_per_unit', 'tax_percentage')  
@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ('email',)  
    search_fields = ('email',)  
@admin.register(Purchase)
class PurchaseAdmin(admin.ModelAdmin):
    list_display = ('customer','products','total_amount','tax_amount','date')  
    search_fields = ('customer',)  
@admin.register(Denomination)
class DenominationAdmin(admin.ModelAdmin):
    list_display = ('id', 'value', 'count')  
    search_fields = ('value',)