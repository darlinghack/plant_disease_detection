from django.shortcuts import render , redirect
from user_app.models import *
from django.contrib import messages
from user_app.forms import *
import os

from PIL import Image
import torchvision.transforms.functional as TF
from user_app import CNN
import numpy as np
import torch
import pandas as pd

# Create your views here.

disease_info = pd.read_csv('disease_info.csv' , encoding='cp1252')
supplement_info = pd.read_csv('supplement_info.csv',encoding='cp1252')
model = CNN.CNN(39)    
model.load_state_dict(torch.load("plant_disease_model_1_latest.pt"))
model.eval()

def prediction(image_path):
    image = Image.open(image_path)
    image = image.resize((224, 224))
    input_data = TF.to_tensor(image)
    input_data = input_data.view((-1, 3, 224, 224))
    output = model(input_data)
    output = output.detach().numpy()
    index = np.argmax(output)
    return index

def user_register(request):
    if request.method == 'POST' and request.FILES["pic"]:
        first_name = request.POST.get("firstname")
        last_name = request.POST.get("lastname")
        uemail = request.POST.get("email")
        phone_number = request.POST.get("phone")
        city = request.POST.get("city")
        Age = request.POST.get("age")
        profile_pic = request.FILES["pic"]
        pwd = request.POST.get("password")
        details = User.objects.filter(email=uemail)
        if details:
            messages.info(request,'already exit')
            return redirect('user_register')
        User.objects.create(first_name=first_name,last_name=last_name,email=uemail,phone_number=phone_number,city=city,Age=Age,profile_pic=profile_pic,password=pwd)
    return render(request,'main-temp/user-register.html')

def user_profile(request):
    userrr = request.session["user_id"]
    uuuser = User.objects.get(user_id=userrr)
    context = {"i":uuuser}
    if request.method == "POST":
        first_name = request.POST.get("firstname")
        last_name = request.POST.get("lastname")
        email = request.POST.get("email")
        phone_number = request.POST.get("phone")
        city = request.POST.get("city")
        age = request.POST.get("age")
        pwd = request.POST.get("password")
        if len(request.FILES) != 0:
            profile_pic = request.FILES["pic"]
            uuuser.profile_pic = profile_pic
            uuuser.first_name = first_name
            uuuser.last_name = last_name
            uuuser.email = email
            uuuser.phone_number = phone_number
            uuuser.city = city
            uuuser.Age = age
            uuuser.password = pwd
            uuuser.save()
            messages.success(request,'changes saved')
            return redirect('user_profile')
        else:
            uuuser.first_name = first_name
            uuuser.last_name = last_name
            uuuser.email = email
            uuuser.phone_number = phone_number
            uuuser.city = city
            uuuser.Age = age
            uuuser.password = pwd
            uuuser.save()
            messages.success(request,'changes saved')
            return redirect('user_profile')
    return render(request,'main-temp/user-profile.html',context)

def user_dashboard(request):
    Mildew = Plant_Image.objects.filter(title = 'Powdery Mildew').count()
    Healthy = Plant_Image.objects.filter(title = 'Healthy').count()
    Scab = Plant_Image.objects.filter(title = 'Scab').count()
    rot = Plant_Image.objects.filter(title = 'Black Rot').count()
    rust = Plant_Image.objects.filter(title = 'Cedar rust').count()
    s_Spot = Plant_Image.objects.filter(title = 'Septoria Leaf Spot').count()
    Spot = Plant_Image.objects.filter(title = 'Cercospora Leaf Spot | Gray Leaf Spot').count()
    context = {
        'i':Mildew ,
        'j':Healthy ,
        'k':Scab ,
        'l':rot ,
        'm':rust ,
        'n':s_Spot ,
        'o':Spot ,
    }
    return render(request,'main-temp/user-dashboard.html',context)

def user_plantdd(request):
    userrr = request.session["user_id"]
    uuuser = User.objects.get(user_id=userrr)
    if request.method == 'POST':
        img = request.FILES['img']
        file = Plant_Image.objects.create(img=img,user_i=uuuser)
        file_p = file.img
        file_p = str(file_p)
        file_path = 'media/'+file_p
        pred = prediction(file_path)
        title = disease_info['disease_name'][pred]
        description =disease_info['description'][pred]
        prevent = disease_info['Possible Steps'][pred]
        # image_url = disease_info['image_url'][pred]
        supplement_name = supplement_info['supplement name'][pred]
        supplement_image_url = supplement_info['supplement image'][pred]
        supplement_buy_link = supplement_info['buy link'][pred]
        print('startttttttttttttttttttttttttttttttttttttttttt')
        print(title,description,prevent)
        print('stoppppppppppppppppppppppppppppppppppppppppppppp')
        file.desc = description
        file.prevent = prevent
        file.title = title
        file.s_link = supplement_buy_link
        file.s_img = supplement_image_url
        file.s_name = supplement_name
        file.save()
        return redirect('user_plantresult')
    return render(request,'main-temp/user-plantdd.html')

def user_plantresult(request):
    p = Plant_Image.objects.all().order_by('-img_id').first()
    print(p)
    return render(request,'main-temp/user-plantresult.html',{'p':p})

def logout(request):
    messages.success(request,'logout')
    return redirect('home')