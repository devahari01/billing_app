# Generated by Django 4.2.16 on 2024-11-28 00:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('billing', '0002_denomination_purchase'),
    ]

    operations = [
        migrations.AlterField(
            model_name='purchase',
            name='products',
            field=models.TextField(),
        ),
    ]