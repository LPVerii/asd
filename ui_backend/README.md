# Lantern UI

This project is a Python-based web socket server that communicates with the frontend and 
handles read and write operations with BigQuery.

# Overview

The purpose of this project is to provide a real-time communication channel between the
frontend and BigQuery. The web socket server handles incoming messages from the frontend,
performs the appropriate read or write operations with BigQuery, and sends the results
back to the frontend in real-time.

The project uses the google-cloud-bigquery Python package to interact with BigQuery,
and the websockets python package to implement the web socket server.

# Usage

To start the web socket server, run the following command:

```
python main.py
```
The server will start listening on port 8080 defined in frontend_config.json.

To connect to the server from the local machine, use the -m flag with python:

```
python -m websockets ws://localhost:8080
```

If the websocket is hosted in Cloud Run, wss:// usage is needed.

To check connection U can request for it.

```
{"request":"connection"}
```
Output:
```
Connected to ws://localhost:8080.
< Websocket runs
< Bigquery connected
> {"request":"connection"}
< Connected
>
```

In this example, the frontend connects to the server and bidirectional connection is established.
When the server sends a message event, the frontend logs the message to the console.
The frontend can also send a query event to the server with proper json formatted message.


To get tables from the dataset.
```
{"request":"tables"}
```

The dataset id is stored in frontend_config.json.

To get columns from particular table u can send.    
```
{"request":"columns", "table":"ur_table_name"}
```

To get anomalies data from anomaly table
```
{"request":"anomalies"}
```

To get data from particular cell table
```
{"request":"data", "table":"ur_table_name", "columns":"optional_cols_list"}
```

To get save feedback from user
```
{"request":"save", "anomaly_id":"ur_anomaly_id", "verify_anomaly":"bool_value"}
```
```
{"request":"save", "anomaly_id":"ur_anomaly_id", "anomaly_type":"description"}
```

The project id is taken from ur settings in  gcloud init.

The server handles the query event by executing the SQL query on BigQuery, modyfi the data if needed
 and sending the results back to the frontend in a message event.

# Configuration

The following environment variables, stored in frontend_config.json,
can be used to configure the server:

"dataset_id": dataset id,<br/>
"cols_from_anomaly_tab": implies which columns will be taken from anomaly table,<br/>
"init_cols_for_plot": implies columns to be initialy loaded in UI,<br/>
"timestamp_column_name": point on columns with timestamp,<br/>
"label_column_name": implies name of label column,<br/>
"scale_data": if data should be scaled,<br/>
"port_number": defines port number


# License

This project is the property of Lantern Machinery Analytics, no unauthorized copying is allowed

# Credits

This project was created by Lantern Machinery Analytics. All rights reserved.
