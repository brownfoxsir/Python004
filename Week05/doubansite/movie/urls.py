from django.urls import path,re_path

from . import views


app_name = 'movie'
urlpatterns = [
    path('', views.index, name='index'),
    path('comment/<name>', views.comment, name='comment'),
    re_path(r'^search/$', views.search, name='search'),
]
