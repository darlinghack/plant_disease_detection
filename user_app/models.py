from django.db import models

# Create your models here.

class User(models.Model):
    user_id = models.AutoField(primary_key = True)
    first_name = models.CharField( max_length=100)
    last_name = models.CharField( max_length=100)
    email = models.EmailField(max_length=100)
    phone_number = models.CharField(max_length=100)
    city = models.CharField( max_length=100)
    Age = models.CharField(max_length=100,null=True)
    profile_pic = models.ImageField(upload_to='Image/user',null=True)
    password = models.CharField(max_length=100,null=True)
    user_status = models.CharField(default="pending",max_length=100,null=True)

    class Meta:
        db_table = "user_details"




class Plant_Image(models.Model):
    img_id = models.AutoField(primary_key=True)
    img = models.FileField(upload_to='plant image')
    user_i = models.ForeignKey(User,on_delete=models.CASCADE)
    title = models.TextField(null=True)
    desc = models.TextField(null=True)
    prevent = models.TextField(null=True)
    s_link = models.TextField(null=True)
    s_name = models.TextField(null=True)
    s_img = models.TextField(null=True)
    class Meta:
        db_table = 'plant details'