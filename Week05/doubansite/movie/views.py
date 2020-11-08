from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
from .models import Comment, MovieDetail


def index(request):
    movies_detail = MovieDetail.objects.order_by('rank').all()

    return render(request, 'movie_detail.html', locals())


def comment(request, name):
    comments = MovieDetail.objects.get(name=name).comment_set.all().filter(star__gt=3).order_by('-star', '-agree')

    return render(request, 'comment.html', locals())


def search(request):
    query = request.GET.get('q')
    if not query:
        return render(request, '404.html')
    try:

        movie = MovieDetail.objects.get(name=query)
    except:
        return render(request, '404.html')

    return render(request, 'search.html', locals())
