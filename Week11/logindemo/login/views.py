from django.shortcuts import render, redirect

# Create your views here.

from .form import LoginForm
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
def demo_login(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():            
            login_data = login_form.cleaned_data 
            print(login_data['username'])
            print(login_data['password'])
            user = authenticate(username=login_data['username'], password=login_data['password'])
            if user:                
                login(request, user)  
                return redirect("/admin/")
            else:
                error_msg = "用户名或密码不正确，请重新尝试"
                return render(request, "login.html", {
                'login_error_msg': error_msg,                
            })
                # return HttpResponse('用户名或密码错误')
    if request.method == "GET":
        login_form = LoginForm()
        return render(request, 'login.html', {'form': login_form})