# E-Commerce Project For Baby Tools

## Table of Contents

1. [Description](#description)
2. [Technologies](#technologies)
3. [Quickstart](#quickstart)
4. [Usage](#usage)
5. [Media](#media)
6. [Docker](#docker)
7. [Notes](#notes)
8. [Photos](#photos)

## Description

This repository contains an e-commerce project for baby tools developed with Django 4.0.2 and Python 3.9. The goal is to provide a platform where users can browse, purchase, and manage baby products. It includes features such as product filtering, detail views, user registration, and login.

## Technologies

- Python 3.9
- Django 4.0.2
- Venv

## Quickstart

### Prerequisites

- Python 3.9 installed
- Virtual environment (`venv`) set up
- Docker installed and running on the system

### Quickstart Guide

1. **Clone the repository:**

    ```sh
    git clone https://github.com/MartaNaranjoEipperle/baby-tools-shop.git
    cd baby-tools-shop
    ```

2. **Create and activate the virtual environment:**

    ```sh
    python -m venv venv
    source venv/bin/activate   # On Windows: venv\Scripts\activate
    ```

3. **Generate `requirements.txt` based on installed packages:**

    ```sh
    pip freeze -l > requirements.txt
    ```

4. **Install dependencies from `requirements.txt`:**

    ```sh
    pip install -r requirements.txt
    ```

5. **Apply Django migrations:**

    ```sh
    python manage.py migrate
    ```

6. **Start the development server:**

    ```sh
    python manage.py runserver
    ```

    Open your browser and go to `http://127.0.0.1:8000` to view the application.

## Usage

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

## Docker

- **Dockerfile**: The Dockerfile is available in the root directory of this repository. It describes the configuration to build a Docker image that runs the application. You can use it to isolate and run your application in a Docker environment.

    Here's an example Dockerfile content for your Django application:

    ```dockerfile
    # Base image
    FROM python:3.10-alpine

    # Working directory inside the container
    WORKDIR /code

    # Copy requirements.txt and install dependencies
    COPY requirements.txt .
    RUN pip install -r requirements.txt

    # Copy the rest of the code
    COPY . .

    # Expose port
    EXPOSE 8025

    # Entry point for the application
    ENTRYPOINT ["python", "babyshop_app/manage.py"]

    # Default command to start the server
    CMD ["runserver", "0.0.0.0:8025"]
    ```

    Use `docker build -t myproject .` to build the Docker image and `docker run -p 8025:8025 myproject` to start the application in a container.

## Notes

This section provides some important tips for interacting with this repository:

- Settings and configurations for Django can be found in `babyshop_app/babyshop/settings.py`.
- Routing information is located in the file `babyshop_app/babyshop/urls.py`.

## Photos

### Home Page with Login

![Home Page with Login](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323080815407.jpeg)

### Home Page with Filter

![Home Page with Filter](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323080840305.jpeg)

### Product Detail Page

![Product Detail Page](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323080934541.jpg)

### Home Page without Login

![Home Page without Login](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323080953570.jpeg)

### Register Page

![Register Page](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323081016022.jpg)

### Login Page

![Login Page](https://github.com/MartaNaranjoEipperle/baby-tools-shop/blob/master/project_images/capture_20220323081044867.jpg)
