# Generated by Django 4.1.7 on 2023-03-10 10:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_app', '0003_user_age'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='user_status',
            field=models.CharField(default='pending', max_length=100, null=True),
        ),
    ]
