# Generated by Django 4.1.7 on 2023-03-15 13:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_app', '0012_plant_image_s_img_plant_image_s_link_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plant_image',
            name='s_img',
            field=models.TextField(null=True),
        ),
    ]
