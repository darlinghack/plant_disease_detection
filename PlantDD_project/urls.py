"""PlantDD_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from main_app import views as main_views
from user_app import views as user_views
from admin_app import views as admin_views

urlpatterns = [
    #main
    path('admin/', admin.site.urls),
    path('',main_views.main_home,name="home"),
    path('about',main_views.main_about,name="about"),
    path('userlogin',main_views.main_ulogin,name="user_login"),
    path('adminlogin',main_views.main_alogin,name="admin_login"),
    path('contact',main_views.main_contact,name="contact"),
    #user 
    path('user_register',user_views.user_register,name="user_register"),
    path('user_profile',user_views.user_profile,name="user_profile"),
    path('user_dashboard',user_views.user_dashboard,name="user_dashboard"),
    path('user_plantdd',user_views.user_plantdd,name="user_plantdd"),
    path('user_plantresult',user_views.user_plantresult,name="user_plantresult"),
    path('logout', user_views.logout,name="logout"),
    #admin
    path('admin_dashboard',admin_views.admin_dashboard,name="admin_dashboard"),
    path('admin_pendusers',admin_views.admin_pendusers,name="admin_pendusers"),
    path('admin_allusers',admin_views.admin_allusers,name="admin_allusers"),
    path('admin_diseaseany',admin_views.admin_diseaseany,name="admin_diseaseany"),
    path('admin_graphany',admin_views.admin_graphany,name="admin_graphany"),
    path('admin_modeltrain',admin_views.admin_modeltrain,name="admin_modeltrain"),
    path('accept-user/<int:id>', admin_views.accept_user,name="accept_user"),
    path('remove-user/<int:idd>', admin_views.remove_user,name="remove_user"),
    path('remove-userrr/<int:id>', admin_views.remove,name="remove"),
    path('change-status-userrr/<int:id>', admin_views.change_status,name="change_status"),
    path('adlogout', admin_views.adlogout,name="adlogout"),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
