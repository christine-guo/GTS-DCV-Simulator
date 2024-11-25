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
  "http://34.140.35.230:5000": "europe-west1",
  "http://35.185.188.182:5000": "asia-southeast1",
  "http://34.83.63.223:5000": "us-west1",
  "http://34.171.228.132:5000": "us-central1",
  "http://34.88.225.17:5000": "europe-north1",
  "http://34.75.246.52:5000": "us-east1",
  "http://35.221.197.15:5000": "asia-east1",

  "http://34.116.152.217:5000" : "europe-central2",
   "http://34.128.74.245:5000" : "asia-southeast2",
  "http://34.129.43.197:5000" : "australia-southeast2",
   "http://34.130.22.192:5000" : "northamerica-northeast2",
   "http://34.142.26.73:5000" : "europe-west2",
   "http://34.147.106.249:5000" : "europe-west4",
   "http://34.159.85.160:5000" : "europe-west3",
   "http://34.175.142.51:5000" : "europe-southwest1",
   "http://34.35.54.233:5000" : "africa-south1",
   "http://34.47.198.166:5000" : "asia-south1",
   "http://34.47.22.48:5000" : "northamerica-northeast1",
   "http://34.64.90.83:5000" : "asia-northeast3",
   "http://34.65.67.173:5000" : "europe-west6",
   "http://34.92.139.249:5000" : "asia-east2",
   "http://34.97.25.172:5000" : "asia-northeast2",
   "http://35.197.191.62:5000" : "australia-southeast1",
   "http://35.200.25.121:5000" : "asia-northeast1", 

   "http://34.106.107.160:5000": "us-west3",
    "http://34.125.95.45:5000": "us-west4",
    "http://34.131.237.138:5000": "asia-south2",
    "http://34.154.52.56:5000": "europe-west8",
    "http://34.155.182.14:5000": "europe-west9",
    "http://34.162.19.24:5000": "us-east5",
    "http://34.165.74.105:5000": "me-west1",
    "http://34.17.81.211:5000": "europe-west12",
    "http://34.174.46.233:5000": "us-south1",
    "http://34.176.30.137:5000": "southamerica-west1",
    "http://34.18.75.37:5000": "me-central1",
    "http://34.32.22.183:5000": "europe-west10",
    "http://34.51.6.136:5000": "northamerica-south1",
    "http://34.94.146.51:5000": "us-west2",
    "http://34.95.147.207:5000": "southamerica-east1",
    "http://35.245.203.31:5000": "us-east4"


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
        general_logger.debug(f"full dcv completed with status code 207: {errors} \t number of failed vps: {len(errors)}\n")
        return jsonify({"message": "DCV failed at some perspectives", "number of vps with failed dcv requests": len(errors), "failed vp list": errors}), 207 
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
