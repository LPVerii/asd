FROM python:3.10-slim

COPY lantern_utils/connect_bigquery.py ./lantern_utils/connect_bigquery.py
COPY lantern_utils/data_handler.py ./lantern_utils/data_handler.py
COPY lantern_utils/BQ_MySQL_Connector.py ./lantern_utils/BQ_MySQL_Connector.py
COPY lantern_utils/connect_gcs.py ./lantern_utils/connect_gcs.py
COPY ui_backend/. ./ui_backend/

WORKDIR /ui_backend

RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python", "main.py"]
