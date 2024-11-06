import requests
from flask import Flask, request, jsonify
from concurrent.futures import ThreadPoolExecutor
import traceback
import os

app = Flask(__name__)

LOG_DIR = '/var/log/apache2/'

# dictionary of all VM URLs + datacenters [need to manually edit w/ each deployment]
all_vms = {
  "http://34.140.253.68:5000": "europe-west1-b",
  "http://34.142.163.236:5000": "asia-southeast1-a",
  "http://34.168.191.142:5000": "us-west1-a",
  "http://34.57.213.209:5000": "us-central1-a",
  "http://34.88.96.91:5000": "europe-north1-a",
  "http://35.190.158.103:5000": "us-east1-b",
  "http://35.229.155.24:5000": "asia-east1-a",
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
                exc_message = f"error processing request at {datacenter}"
                errors.append(f"{exc_message}\nexception: {str(e)}")
                # log exceptions to a file 
                log_file_path = LOG_DIR + f"{node_a}_{node_b}.log"  
                with open(log_file_path, 'a') as log_file:
                    log_file.write(f"\n {exc_message}\n")
                    traceback.print_exception(type(e), e, e.__traceback__, file=log_file)
                
    if server_error_flag:
        return jsonify({"errors": errors, "message": "internal server error occurred"}), 501 
    if errors:
        return jsonify({"errors": errors, "message": "DCV failed at some perspectives"}), 500
    else:
        return jsonify({"message": "DCV completed at all 7 GCP perspectives!"}), 200

# function to run DCV at the current perspective and return a response when done 
@app.route('/validate', methods=['POST'])
def validate():
    data = request.json
    domain = data.get('domain')
    datacenter = data.get('datacenter')
    token = data.get('token')

    json_data = {
        "domain": domain, 
        "token": token, 
        "datacenter": datacenter
    }

    # ping the domain through an http post request 
    try: 
        response = requests.post(f"http://{domain}/dcv", json = json_data, timeout=30)
        return {"status_code": response.status_code}, 200  
    except requests.exceptions.Timeout as e:
        return {"timeout": str(e)}, 408  
    except requests.exceptions.RequestException as e:
        return {"request failed": str(e)}, 500  
    



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

