from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path("generate-bill/", views.generate_bill, name="generate_bill"),  # For handling form submission
    path('products/', views.products_page, name='products_page'),
    path('purchases/', views.purchases_page, name='purchases_page'),

    # path('products/add/', views.product_add, name='product_add'),  # Add product
    # path('products/<int:id>/', views.product_detail, name='product_detail'),  # View details
    # path('products/<int:id>/edit/', views.product_edit, name='product_edit'),  # Edit product
    # path('products/<int:id>/delete/', views.product_delete, name='product_delete'),
]
