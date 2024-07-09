# Django Setup Guide

This file contains instructions for configuring and using the Django application for the Babyshop project. Follow the steps outlined below to properly set up and customize the application.

1. [Usage](#usage)
2. [Media](#media)

# Usage

### Configuration

- Django settings and configurations are located in `babyshop_app/babyshop/settings.py`. Here, you can modify database settings, installed apps, and middleware, among others.

- To add template directories (`templates`), the following paths were included under `DIRS` in the settings:
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
    This modification allows Django to search additional directories for templates (HTML files), enabling us to centralize our templates in `templates` and specific product templates in `products`.

### Adjusting Routes

- Routing information can be found in `babyshop_app/babyshop/urls.py`. Below are the relevant changes:

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

- I created a directory named `media` under `babyshop_app/babyshop/media` to store images and other media files. This directory is crucial for storing product images and other media assets used in the application.

- To populate the `media` directory, I logged into the Django admin page (`/admin`) and added products with associated categories and descriptions. These actions automatically populated the `media` directory with the necessary photos and media files.

For further reference on configuring media handling in Django, refer to the [Django documentation on managing files](https://docs.djangoproject.com/en/stable/topics/files/).
