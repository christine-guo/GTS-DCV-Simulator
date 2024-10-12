import requests
from flask import Flask, request

app = Flask(__name__)

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
