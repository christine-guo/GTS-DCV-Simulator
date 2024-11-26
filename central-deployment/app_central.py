import requests
from flask import Flask, request, jsonify
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timezone
import traceback
import os
import logging 

# Create General Logger-- includes error and http (which includes access)
general_logger = logging.getLogger("GeneralLogger")

# anything INFO and more important will be logged (debug is lowest, critical is highest)
# allows us to filter what is logged
general_logger.setLevel(logging.DEBUG)

# defines which file is written to and in what format
general_handler = logging.FileHandler("general.log")
general_handler.setFormatter(logging.Formatter('%(asctime)s - GENERAL - %(levelname)s - %(message)s'))
general_logger.addHandler(general_handler)

app = Flask(__name__)

# dictionary of all VM URLs + datacenters [need to manually edit w/ each deployment]
all_vms = {
    "http://34.106.15.202:5000": "us-west3",
    "http://34.124.154.125:5000": "asia-southeast",
    "http://34.125.3.165:5000": "us-west4",
    "http://34.131.135.215:5000": "asia-south2",
    "http://34.148.238.226:5000": "us-east",
    "http://34.154.252.52:5000": "europe-west8",
    "http://34.155.191.189:5000": "europe-west9",
    "http://34.165.66.189:5000": "me-west1",
    "http://34.169.111.162:5000": "us-west",
    "http://34.17.90.248:5000": "europe-west12",
    "http://34.18.91.250:5000": "me-central1",
    "http://34.28.117.49:5000": "us-central",
    "http://34.32.83.145:5000": "europe-west10",
    "http://34.51.15.202:5000": "northamerica-south1",
    "http://34.81.204.66:5000": "asia-east",
    "http://34.88.186.236:5000": "europe-north",
    "http://35.187.168.103:5000": "europe-west", 

    "http://34.101.65.201:5000": "asia-southeast2",
    "http://34.118.89.192:5000": "europe-central2",
    "http://34.129.96.93:5000": "australia-southeast2",
    "http://34.130.173.246:5000": "northamerica-northeast2",
    "http://34.151.97.99:5000": "australia-southeast1",
    "http://34.162.59.9:5000": "us-east5",
    "http://34.174.120.63:5000": "us-south1",
    "http://34.175.191.8:5000": "europe-southwest1",
    "http://34.176.62.137:5000": "southamerica-west1",
    "http://34.32.183.103:5000": "europe-west4",
    "http://34.35.34.237:5000": "africa-south1",
    "http://34.47.216.25:5000": "asia-south1",
    "http://34.64.167.185:5000": "asia-northeast3",
    "http://34.65.86.145:5000": "europe-west6",
    "http://34.84.143.218:5000": "asia-northeast1",
    "http://34.89.228.29:5000": "europe-west3",
    "http://34.89.80.161:5000": "europe-west2",
    "http://34.97.245.169:5000": "asia-northeast2",
    "http://35.188.244.163:5000": "us-east4",
    "http://35.203.26.123:5000": "northamerica-northeast1",
    "http://35.220.224.243:5000": "asia-east2",
    "http://35.236.27.133:5000": "us-west2",
    "http://35.247.193.103:5000": "southamerica-east1"


}


# sends a http post request to validate the domain at the given VM
def send_request(vm_url, domain, datacenter, token):
    json_data = {
        "domain": domain, 
        "token": token, 
        "datacenter": datacenter
    }
    try:
        response = requests.post(f"{vm_url}/validate", json=json_data, timeout=30)
        return datacenter, response.status_code
    except requests.exceptions.Timeout as e:
        return datacenter, 408  
    except requests.exceptions.RequestException as e:
        return datacenter, 500  


# function to begin running DCV at all 7 GCP perspectives 
@app.route('/run-all', methods=['POST'])
def runAll():
    data = request.json
    domain = data.get('domain')
    token = data.get('token')
    node_a = data.get('node_a')
    node_b = data.get('node_b')

    errors = []
    server_error_flag = False

    # send DCV requests to all VMs and wait for their completion
    with ThreadPoolExecutor() as executor:
        futures = {executor.submit(send_request, vm_url, domain, datacenter, token): (vm_url, datacenter) for vm_url, datacenter in all_vms.items()}
        for future in futures:
            vm_url, datacenter = futures[future]
            try:
                datacenter, status_code = future.result()  
                if status_code != 200:
                    errors.append(f"dcv at {datacenter} failed with status code {status_code}")
            except Exception as e: 
                server_error_flag = True
                errors.append(f"internal server error: {str(e)}")
                # log exceptions to a file   
                general_logger.debug(f"request to run dcv at {datacenter} failed with exception: {e} \t") 
                general_logger.debug(traceback.format_exception_only(type(e), e, e.__traceback__))

    general_logger.debug(f"certificate request received from client: {data} \t")
    if server_error_flag:
        general_logger.debug(f"full dcv completed with status code 501: {errors}\n")
        return jsonify({"message": "internal server error occurred", "errors": errors}), 501 
    if errors:
        general_logger.debug(f"full dcv completed with status code 207, failed_vps: {errors}\n")
        return jsonify({"message": "DCV failed at some perspectives", "failed_vps": errors}), 207 
    else:
        general_logger.debug(f"full dcv completed with status code 200\n")
        return jsonify({"message": "DCV completed at all 40 GCP perspectives!"}), 200 

        
# function to run DCV at the current perspective and return a response when done 
@app.route('/validate', methods=['POST'])
def validate():

    data = request.json
    domain = data.get('domain')
    datacenter = data.get('datacenter')
    token = data.get('token')
    
    # ping the domain through an http post request 
    general_logger.debug(f"request to be sent: {request} \t")
    try: 
        response = requests.get(f"http://{domain}/.well-known/gca-challenge/{token}?datacenter={datacenter}", timeout=30)
        general_logger.debug(f"request succeeded, sending response: {response} \n")
        return {"status_code": response.status_code}, 200  
    except requests.exceptions.Timeout as e:
        general_logger.debug(f"request timed out with exception: {e} \n")
        return {"timeout": str(e)}, 408  
    except requests.exceptions.RequestException as e:
        general_logger.debug(f"request failed with exception: {e} \n")
        return {"request failed": str(e)}, 500  
    



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)