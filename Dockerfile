FROM python:3.10-alpine

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8025

ENTRYPOINT ["python", "babyshop_app/manage.py"]

CMD ["runserver", "0.0.0.0:8025"]