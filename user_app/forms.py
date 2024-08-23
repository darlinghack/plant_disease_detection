from django import forms
from django.forms import fields
from user_app.models import *

class login_form(forms.ModelForm):
    email = forms.EmailField()