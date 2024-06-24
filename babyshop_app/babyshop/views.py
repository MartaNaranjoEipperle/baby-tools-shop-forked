from django.shortcuts import render

def index(request):
    # Hier kommt die Logik für die Index-Ansicht
    return render(request, 'index.html')