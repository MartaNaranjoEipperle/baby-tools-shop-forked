FROM python:3.10-alpine

ARG WORKDIR=/code
ARG PORT=8025

WORKDIR ${WORKDIR}

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE ${PORT}

ENV DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}

ENTRYPOINT ["python", "babyshop_app/manage.py"]

CMD ["runserver", "0.0.0.0:8025"]