from django.shortcuts import render, redirect
from user_app.models import *
from django.contrib import messages

# Create your views here.

def main_home(request):
    return render(request,'main-temp/main-home.html')

def main_about(request):
    return render(request,'main-temp/main-about.html')

def main_ulogin(request):
    if request.method == "POST":
        email = request.POST.get("email")
        pwd = request.POST.get("password")
        try:
            user_a = User.objects.get(email=email, password=pwd)
            if user_a.user_status == "pending":
                messages.info(request,'your account is pendind !')
                return redirect("user_login")
            request.session["user_id"] = user_a.user_id
            messages.success(request,'Login Successful !')
            return redirect("user_dashboard")
        except:
            return redirect("user_login")
    return render(request,'main-temp/main-userlogin.html')

def main_alogin(request):
    if request.method == "POST":
        uname = request.POST.get("uname")
        pwd = request.POST.get("password")
        if uname == "admin" and pwd == "admin":
            messages.success(request,'login')
            return redirect("admin_dashboard")
        else:
            return redirect("admin_login")

    return render(request,'main-temp/main-adminlogin.html')

def main_contact(request):
    return render(request,'main-temp/main-contact.html')