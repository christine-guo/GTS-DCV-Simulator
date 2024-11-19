# Define the network
resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_project_default_network_tier" "default" {
  network_tier = "STANDARD"
}

# List of available regions
variable "regions" {
  default = [
    "asia-east1", "asia-east2", "asia-northeast1", "asia-northeast2", "asia-northeast3",
    "asia-south1", "asia-south2", "asia-southeast1", "asia-southeast2", 
    "australia-southeast1", "australia-southeast2",
    "europe-central2", "europe-north1", "europe-west1", "europe-west2", 
    "europe-west3", "europe-west4", "europe-west6",
    "northamerica-northeast1", "northamerica-northeast2",
    "southamerica-east1", "southamerica-west1",
    "us-central1", "us-east1", "us-east4", "us-west1", "us-west2", "us-west3", "us-west4",
    "us-south1"
  ]
}

# Create subnetworks and VM instances for each region
resource "google_compute_subnetwork" "subnets" {
  for_each      = toset(var.regions)
  name          = "my-custom-subnet-${each.value}"
  ip_cidr_range = "10.${each.key}.0.0/24"
  region        = each.value
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "vms" {
  for_each      = toset(var.regions)
  name          = "flask-vm-${each.value}"
  machine_type  = "e2-micro"
  zone          = "${each.value}-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnets[each.key].id

    access_config {
      # External IP address
    }
  }
}

# Firewall rules (SSH and Flask)
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "flask" {
  name    = "allow-flask"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# Output external IP addresses for all VMs
output "Web-server-VM-URLs" {
  value = {
    for region, instance in google_compute_instance.vms :
    region => "http://${instance.network_interface.0.access_config.0.nat_ip}:5000"
  }
}
