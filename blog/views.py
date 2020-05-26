from django.shortcuts import render

posts = [
  {
    'author': 'ABC',
    'title': 'Post 1',
    'content':'First Post',
    'date_posted': 'August 27, 2020'
  },
  {
    'author': 'XYZ',
    'title': 'Post 2',
    'content':'Second Post',
    'date_posted': 'August 28, 2020'
  }
]

def home(request):
  return render(request, 'blog/home.html')

def about(request):
  return render(request, 'blog/about.html')