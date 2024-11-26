#!/bin/bash

# Set Google Cloud project (replace with your actual project ID)
PROJECT_ID="gcp-deployment-add1"
gcloud config set project $PROJECT_ID

# Define VMs and their corresponding zones
declare -A VMS_ZONES
VMS_ZONES=(
    ["flask-vm-asia-northeast1"]="asia-northeast1-a"
    ["flask-vm-australia-southeast1"]="australia-southeast1-a"
    ["flask-vm-europe-west2"]="europe-west2-a"
    ["flask-vm-europe-west3"]="europe-west3-a"
    ["flask-vm-asia-south1"]="asia-south1-a"
    ["flask-vm-northamerica-northeast1"]="northamerica-northeast1-a"
    ["flask-vm-europe-west4"]="europe-west4-a"
    ["flask-vm-asia-east2"]="asia-east2-a"
    ["flask-vm-europe-west6"]="europe-west6-a"
    ["flask-vm-asia-northeast2"]="asia-northeast2-a"
    ["flask-vm-asia-northeast3"]="asia-northeast3-a"
    ["flask-vm-asia-southeast2"]="asia-southeast2-a"
    ["flask-vm-europe-central2"]="europe-central2-a"
    ["flask-vm-northamerica-northeast2"]="northamerica-northeast2-a"
    ["flask-vm-australia-southeast2"]="australia-southeast2-a"
    ["flask-vm-europe-southwest1"]="europe-southwest1-a"
    ["flask-vm-africa-south1"]="africa-south1-a"
    ["flask-vm-southamerica-west1"]="southamerica-west1-a"
    ["flask-vm-southamerica-east1"]="southamerica-east1-a"
    ["flask-vm-us-east4"]="us-east4-a"
    ["flask-vm-us-west2"]="us-west2-a"
    ["flask-vm-us-east5"]="us-east5-a"
    ["flask-vm-us-south1"]="us-south1-a"
)

# Path to the Flask app (assumes app.py is in the same directory as this script)
APP_FILE="app.py"

# Check if files exist
if [ ! -f "$APP_FILE" ]; then
  echo "Error: $APP_FILE not found!"
  exit 1
fi 


# Loop through each VM, transfer the app.py file, and run the Flask app concurrently
for INSTANCE_NAME in "${!VMS_ZONES[@]}"; do
    ZONE=${VMS_ZONES[$INSTANCE_NAME]}
    (
        echo "Starting setup for $INSTANCE_NAME in zone $ZONE"

        # Kill any existing Flask processes
        echo "Killing any existing Flask processes on $INSTANCE_NAME..."
        gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --command="sudo pkill -f 'python3.*app.py'"
        sleep 2  # Optional: Add a short sleep to ensure the processes are properly killed

        # Transfer the Flask app file to the VM
        echo "Transferring $APP_FILE to $INSTANCE_NAME in zone $ZONE..."
        gcloud compute scp $APP_FILE $INSTANCE_NAME:/tmp/ --zone=$ZONE

        # Run the new Flask app on the VM
        echo "Running Flask app on $INSTANCE_NAME..."
        gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --command="cd /tmp/ && nohup python3 $APP_FILE --host=0.0.0.0" 

    ) &

done

# Wait for all background jobs to finish
wait

echo "Flask app is running on all VMs. Access them using their external IPs on port 5000."
