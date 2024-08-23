from django.shortcuts import render , redirect
from user_app.models import *
from django.core.paginator import Paginator
from django.contrib import messages
from django.db.models import Q
# Create your views here.

def admin_dashboard(request):
    ausers = User.objects.filter(Q(user_status="accepted") | Q(user_status="restricted")).count()
    pusers = User.objects.filter(user_status="pending").count()
    acusers = User.objects.filter(user_status="accepted").count()
    return render(request,'admin-temp/admin-dashboard.html',{'ausers':ausers,'pusers':pusers,'acusers':acusers})

def admin_pendusers(request):
    pusers = User.objects.filter(user_status="pending")
    paginator = Paginator(pusers,5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request,'admin-temp/admin-pendingusers.html',{'pusers':pusers,'user':post})

def admin_allusers(request):
    ausers = User.objects.filter(Q(user_status="accepted") | Q(user_status="restricted"))
    paginator = Paginator(ausers,5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request,'admin-temp/admin-allusers.html',{'ausers':ausers,'user':post})

def admin_diseaseany(request):
    ausers = Plant_Image.objects.all().order_by('-img_id')
    paginator = Paginator(ausers,5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request,'admin-temp/admin-deseaseany.html',{'user':post})

def admin_graphany(request):
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
    return render(request,'admin-temp/admin-graphanylasis.html',context)

def admin_modeltrain(request):
    return render(request,'admin-temp/admin-modeltrain.html')

def accept_user(request,id):
    status_update = User.objects.get(user_id=id)
    status_update.user_status = "accepted"
    status_update.save()
    messages.success(request,'user accepted')
    return redirect('admin_pendusers')

def remove_user(request,idd):
    status_updatee = User.objects.get(user_id=idd)
    status_updatee.user_status = "removed"
    status_updatee.save()
    messages.success(request,'removed successfully')
    return redirect('admin_pendusers')

def change_status(request,id):
    status_update = User.objects.get(user_id=id)
    if status_update.user_status == "accepted":
        status_update.user_status = "restricted"
        status_update.save()
        messages.success(request,'user restricted')
        return redirect('admin_allusers')
    elif status_update.user_status == "restricted":
        status_update.user_status = "accepted"
        status_update.save()
        messages.success(request,'user active')
        return redirect('admin_allusers')
    else:
        status_update.user_status = "pending"
        status_update.save()
        return redirect('admin_allusers')
    
    
def remove(request,id):
    status_delete = User.objects.get(user_id = id)
    status_delete.delete()
    messages.success(request,'removed succesfully')
    return redirect('admin_allusers')

def adlogout(request):
    messages.success(request,'logout')
    return redirect('home')