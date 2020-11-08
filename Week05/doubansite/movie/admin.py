from django.contrib import admin

# Register your models here.
from .models import MovieDetail, Comment

admin.site.register(MovieDetail)
admin.site.register(Comment)