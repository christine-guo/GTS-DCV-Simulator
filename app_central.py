import requests
from flask import Flask, request

app = Flask(__name__)

# List of all VM URLs [MUST DO THIS MANUALLY EVERY TIME SPIN UP NEW VMs]
all_vms = [
  "http://35.227.30.251:5000",
  "http://35.192.81.17:5000",
  "http://35.197.104.168:5000",
  "http://34.38.225.117:5000",
  "http://35.228.48.60:5000",
  "http://104.155.214.65:5000",
  "http://34.87.87.112:5000",
]

@app.route('/run-all', methods=['POST'])
def runAll():
    data = request.json
    domain = data.get('domain')
    token = data.get('token')

    # Send requests to other VMs
    for vm in other_vms:
        requests.post(f"{vm}/validate", json={"domain": domain, "token": token})

    return {"message": "All validated"}, 200

@app.route('/validate', methods=['POST'])
def validate():
    data = request.json
    domain = data.get('domain')
    token = data.get('token')

    # ping the domain through an http get request 
    try: 
        response = requests.get(f"http://{domain}/?token={token}", timeout=30)
        return response.text    
    except requests.RequestException:
        return None  # Return None (null in JSON) if the request fails or times out


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

