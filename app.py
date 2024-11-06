import requests
from flask import Flask, request, jsonify

app = Flask(__name__)

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
