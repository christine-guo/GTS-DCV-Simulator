#!/bin/bash

# Set Google Cloud project (replace with your actual project ID)
PROJECT_ID="gcp-deployment-central"
gcloud config set project $PROJECT_ID

# Define VMs and their corresponding zones
declare -A VMS_ZONES
VMS_ZONES=(
  ["flask-vm-us-east"]="us-east1-b"
  ["flask-vm-us-central1"]="us-central1-a"
  ["flask-vm-us-west"]="us-west1-a"
  ["flask-vm-europe-west"]="europe-west1-b"
  ["flask-vm-europe-north"]="europe-north1-a"
  ["flask-vm-asia-east"]="asia-east1-a"
  ["flask-vm-asia-southeast"]="asia-southeast1-a"
  ["flask-vm-us-west3"]="us-west3-a"
  ["flask-vm-us-west4"]="us-west4-a"
  ["flask-vm-asia-south2"]="asia-south2-a"
  ["flask-vm-europe-west8"]="europe-west8-a"
  ["flask-vm-europe-west9"]="europe-west9-b"
  ["flask-vm-me-west1"]="me-west1-a"
  ["flask-vm-europe-west12"]="europe-west12-a"
  ["flask-vm-me-central1"]="me-central1-a"
  ["flask-vm-europe-west10"]="europe-west10-a"
  ["flask-vm-northamerica-south1"]="northamerica-south1-a"
)

# Path to the Flask app (assumes app.py is in the same directory as this script)
APP_FILE="app.py"
APP_CENTRAL_FILE="app_central.py"

# Check if files exist
if [ ! -f "$APP_FILE" ]; then
  echo "Error: $APP_FILE not found!"
  exit 1
fi 

if [ ! -f "$APP_CENTRAL_FILE" ]; then
  echo "Error: $APP_CENTRAL_FILE not found!"
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

        # Transfer the correct Flask app file to the VM
        if [ "$INSTANCE_NAME" == "flask-vm-us-east" ]; then
            echo "Transferring $APP_CENTRAL_FILE to $INSTANCE_NAME in zone $ZONE..."
            gcloud compute scp $APP_CENTRAL_FILE $INSTANCE_NAME:/tmp/ --zone=$ZONE
            gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --command="mv /tmp/$APP_CENTRAL_FILE /tmp/$APP_FILE"
        else
            echo "Transferring $APP_FILE to $INSTANCE_NAME in zone $ZONE..."
            gcloud compute scp $APP_FILE $INSTANCE_NAME:/tmp/ --zone=$ZONE
        fi

        # Run the new Flask app on the VM
        echo "Running Flask app on $INSTANCE_NAME..."
        gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --command="cd /tmp/ && nohup python3 $APP_FILE --host=0.0.0.0" 

    ) &

done

# Wait for all background jobs to finish
wait

echo "Flask app is running on all VMs. Access them using their external IPs on port 5000."
