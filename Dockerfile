FROM python:3.10-alpine

ARG WORKDIR=/app
ARG PORT=8025

WORKDIR ${WORKDIR}

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

WORKDIR /app/babyshop_app

RUN python manage.py makemigrations && \ 
    python manage.py migrate && \
    python manage.py collectstatic

EXPOSE ${PORT}

ENV DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}

ENTRYPOINT ["python", "manage.py"]

CMD ["runserver", "0.0.0.0:8025"]
