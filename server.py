#!/usr/bin/python3
from flask import Flask, request, Response
from datetime import datetime
import json
#from collections import OrderedDict


app = Flask(__name__)

@app.route('/')
def simple_time_service():
    visitor_ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    current_time = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S") + " UTC" 

    response_data = {
            "timestamp": current_time,
            "ip": visitor_ip
        }

    return Response(json.dumps(response_data), mimetype='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
