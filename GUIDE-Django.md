# Django Setup Guide

This file contains instructions for configuring and using the Django application for the Babyshop project. Follow the steps outlined below to properly set up and customize the application.

1. [Usage](#usage)
2. [Media](#media)

# Usage

### Configuration

- Django settings and configurations are located in `babyshop_app/babyshop/settings.py`. Here, you can modify database settings, installed apps, and middleware, for example.

- To add template directories (`templates`), we added the following paths under `DIRS` in the settings:
    ```python
    TEMPLATES = [
        {
            ...
            'DIRS': [
                os.path.join(BASE_DIR, 'templates'),
                os.path.join(BASE_DIR, 'products'),
            ],
            ...
        },
    ]
    ```
    This change allows Django to search additional directories for templates (HTML files), allowing us to store templates centrally in `templates` and specifically for products in `products`.

### Adjusting Routes

- Routing information can be found in `babyshop_app/babyshop/urls.py`. Here are the changes we made:

- **views.py**:
  ```python
  from django.shortcuts import render

  def index(request):
      # Logic for the index view goes here
      return render(request, 'index.html')
    ```

- **urls.py**:
    ```python
    from django.urls import path
    from . import views

    urlpatterns = [
        path('', views.index, name='index'),
    ]
    ```

## Media

- I created a directory named `media` under `babyshop_app/babyshop/media` to store images and other media files.

- To populate the media directory, I logged in to the admin page (`/admin`) and added products with categories and descriptions. These actions populated the `media` directory with photos.
