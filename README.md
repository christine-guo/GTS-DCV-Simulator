# README 

## Overview 
This codebase simulates domain control validation (DCV) by the Certificate Authority (CA) Google Trust Services. 

## CA Configuration Setup 
Because the simulation uses 7 GCP VMs, Google cloud shell is used for deployment. 
1. **Create a new Google Cloud project**
    - Take note of your project ID: in this example, the project ID is gcp-std-testing-v2. Replace all instances of this ID in deploy.sh with yours.
    - Download a copy of this repo into your project
2.  **Deploy VMs and their respective app**
    - OPTIONAL: if you want to change the VM routing tier from premium (default) to standard, add the following line to main.tf
      ```bash
        resource "google_compute_project_default_network_tier" "default" {
            network_tier = "STANDARD"
        }
      ```
    - Run the following line to deploy the VMs:
      ```bash
        terraform apply
      ```
    - From the terraform apply output, copy the list of vms and their respective datacenters. Paste the list into the list all_vms in app_central.py and edit any necessary syntax.
      - **[WORKING TO AUTOMATE THIS]**
    - Run the following line to deploy the app file to each respective VM:
      ```bash
        ./deploy.sh
      ```
    - If you want to update the VM app files, just run the above command again to kill any previous app processes and run the new file


## How to run DCV
Run the following command to execute DCV on a given domain (here example.com is used) 
```bash
  curl -X POST [INSERT US-EAST VM URL HERE]/run-all -H "Content-Type: application/json" -d '{"domain": "example.com"}’
```
  - Optional Query Parameters
    - "token": unique token to track http request in logs  
    - "node_a": unique identifier of the first node (used to track any errors during attacks) 
    - "node_b": unique identifier of the second node (used to track any errors during attacks)

## Logging 
Within the central VM, you can track all attacks through the test_error (internal server errors) and test_summary (all dcv requests) folders. 
  - All attacks are logged in the format "{node_a}_{node_b}.log"


## CA Removal 
Run the following command to remove the 7 VM instances
```bash
  terraform destroy
```
