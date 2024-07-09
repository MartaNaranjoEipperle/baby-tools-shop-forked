FROM python:3.10-alpine

ENV WORKDIR=/app
ENV PORT=8025

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

ENTRYPOINT ["sh", "-c", "python manage.py"]

CMD ["sh", "-c", "runserver 0.0.0.0:${PORT:-8025}"]
