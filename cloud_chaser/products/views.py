from django.shortcuts import render
from django.db import connection

# Create your views here.
def product_list(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT id_product, name, start_date, end_date FROM products")
        products = cursor.fetchall()
    return render(request, 'list.html', {'products': products})

