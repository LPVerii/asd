FROM python:3.10-slim

COPY ui_backend/. ./ui_backend/

WORKDIR /ui_backend

RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python", "main.py"]
