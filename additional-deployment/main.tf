# Define the network
resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-network"
  auto_create_subnetworks = false  # Set to false when defining subnetworks manually
  mtu                     = 1460
}
# Subnetworks for each region
resource "google_compute_subnetwork" "subnet_africa_south1" {
  name          = "my-custom-subnet-africa-south1"
  ip_cidr_range = "10.0.8.0/24"
  region        = "africa-south1"
  network       = google_compute_network.vpc_network.id
}


resource "google_compute_subnetwork" "subnet_asia_east2" {
  name          = "my-custom-subnet-asia-east2"
  ip_cidr_range = "10.0.9.0/24"
  region        = "asia-east2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast1" {
  name          = "my-custom-subnet-asia-northeast1"
  ip_cidr_range = "10.0.10.0/24"
  region        = "asia-northeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast2" {
  name          = "my-custom-subnet-asia-northeast2"
  ip_cidr_range = "10.0.11.0/24"
  region        = "asia-northeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast3" {
  name          = "my-custom-subnet-asia-northeast3"
  ip_cidr_range = "10.0.12.0/24"
  region        = "asia-northeast3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_south1" {
  name          = "my-custom-subnet-asia-south1"
  ip_cidr_range = "10.0.13.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_southeast2" {
  name          = "my-custom-subnet-asia-southeast2"
  ip_cidr_range = "10.0.14.0/24"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_australia_southeast1" {
  name          = "my-custom-subnet-australia-southeast1"
  ip_cidr_range = "10.0.15.0/24"
  region        = "australia-southeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_australia_southeast2" {
  name          = "my-custom-subnet-australia-southeast2"
  ip_cidr_range = "10.0.16.0/24"
  region        = "australia-southeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_central2" {
  name          = "my-custom-subnet-europe-central2"
  ip_cidr_range = "10.0.17.0/24"
  region        = "europe-central2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_southwest1" {
  name          = "my-custom-subnet-europe-southwest1"
  ip_cidr_range = "10.0.18.0/24"
  region        = "europe-southwest1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west2" {
  name          = "my-custom-subnet-europe-west2"
  ip_cidr_range = "10.0.19.0/24"
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west3" {
  name          = "my-custom-subnet-europe-west3"
  ip_cidr_range = "10.0.20.0/24"
  region        = "europe-west3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west4" {
  name          = "my-custom-subnet-europe-west4"
  ip_cidr_range = "10.0.21.0/24"
  region        = "europe-west4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west6" {
  name          = "my-custom-subnet-europe-west6"
  ip_cidr_range = "10.0.22.0/24"
  region        = "europe-west6"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_northeast1" {
  name          = "my-custom-subnet-northamerica-northeast1"
  ip_cidr_range = "10.0.23.0/24"
  region        = "northamerica-northeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_northeast2" {
  name          = "my-custom-subnet-northamerica-northeast2"
  ip_cidr_range = "10.0.24.0/24"
  region        = "northamerica-northeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_southamerica_east1" {
  name          = "my-custom-subnet-southamerica-east1"
  ip_cidr_range = "10.0.25.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_southamerica_west1" {
  name          = "my-custom-subnet-southamerica-west1"
  ip_cidr_range = "10.0.26.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_east4" {
  name          = "my-custom-subnet-us-east4"
  ip_cidr_range = "10.0.27.0/24"
  region        = "us-east4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_east5" {
  name          = "my-custom-subnet-us-east5"
  ip_cidr_range = "10.0.28.0/24"
  region        = "us-east5"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_south1" {
  name          = "my-custom-subnet-us-south1"
  ip_cidr_range = "10.0.29.0/24"
  region        = "us-south1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west2" {
  name          = "my-custom-subnet-us-west2"
  ip_cidr_range = "10.0.30.0/24"
  region        = "us-west2"
  network       = google_compute_network.vpc_network.id
}

# VM Instances for each region
resource "google_compute_instance" "vm_africa_south1" {
  name          = "flask-vm-africa-south1"
  machine_type  = "e2-micro"
  zone          = "africa-south1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip git
    pip3 install flask
    # Optionally, deploy your Flask app here
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_africa_south1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_east2" {
  name          = "flask-vm-asia-east2"
  machine_type  = "e2-micro"
  zone          = "asia-east2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip git
    pip3 install flask
    # Optionally, deploy your Flask app here
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_east2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_northeast1" {
  name          = "flask-vm-asia-northeast1"
  machine_type  = "e2-micro"
  zone          = "asia-northeast1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_northeast1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_northeast2" {
  name          = "flask-vm-asia-northeast2"
  machine_type  = "e2-micro"
  zone          = "asia-northeast2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_northeast2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_northeast3" {
  name          = "flask-vm-asia-northeast3"
  machine_type  = "e2-micro"
  zone          = "asia-northeast3-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_northeast3.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_south1" {
  name          = "flask-vm-asia-south1"
  machine_type  = "e2-micro"
  zone          = "asia-south1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_south1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}


resource "google_compute_instance" "vm_asia_southeast2" {
  name          = "flask-vm-asia-southeast2"
  machine_type  = "e2-micro"
  zone          = "asia-southeast2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_southeast2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_australia_southeast1" {
  name          = "flask-vm-australia-southeast1"
  machine_type  = "e2-micro"
  zone          = "australia-southeast1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_australia_southeast1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_australia_southeast2" {
  name          = "flask-vm-australia-southeast2"
  machine_type  = "e2-micro"
  zone          = "australia-southeast2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_australia_southeast2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_central2" {
  name          = "flask-vm-europe-central2"
  machine_type  = "e2-micro"
  zone          = "europe-central2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_central2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_southwest1" {
  name          = "flask-vm-europe-southwest1"
  machine_type  = "e2-micro"
  zone          = "europe-southwest1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_southwest1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west2" {
  name          = "flask-vm-europe-west2"
  machine_type  = "e2-micro"
  zone          = "europe-west2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_west2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west3" {
  name          = "flask-vm-europe-west3"
  machine_type  = "e2-micro"
  zone          = "europe-west3-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_west3.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west4" {
  name          = "flask-vm-europe-west4"
  machine_type  = "e2-micro"
  zone          = "europe-west4-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_west4.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west6" {
  name          = "flask-vm-europe-west6"
  machine_type  = "e2-micro"
  zone          = "europe-west6-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_west6.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_northamerica_northeast1" {
  name          = "flask-vm-northamerica-northeast1"
  machine_type  = "e2-micro"
  zone          = "northamerica-northeast1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_northamerica_northeast1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_northamerica_northeast2" {
  name          = "flask-vm-northamerica-northeast2"
  machine_type  = "e2-micro"
  zone          = "northamerica-northeast2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_northamerica_northeast2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_southamerica_east1" {
  name          = "flask-vm-southamerica-east1"
  machine_type  = "e2-micro"
  zone          = "southamerica-east1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_southamerica_east1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_southamerica_west1" {
  name          = "flask-vm-southamerica-west1"
  machine_type  = "e2-micro"
  zone          = "southamerica-west1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_southamerica_west1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}


resource "google_compute_instance" "vm_us_east4" {
  name          = "flask-vm-us-east4"
  machine_type  = "e2-micro"
  zone          = "us-east4-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_east4.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_us_east5" {
  name          = "flask-vm-us-east5"
  machine_type  = "e2-micro"
  zone          = "us-east5-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_east5.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_us_south1" {
  name          = "flask-vm-us-south1"
  machine_type  = "e2-micro"
  zone          = "us-south1-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_south1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_us_west2" {
  name          = "flask-vm-us-west2"
  machine_type  = "e2-micro"
  zone          = "us-west2-a"
  tags          = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3-pip
    pip3 install flask
  EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_west2.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

# Firewall rules (SSH and Flask)
resource "google_compute_firewall" "ssh" {
  name          = "allow-ssh"
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh"]
}

resource "google_compute_firewall" "flask" {
  name          = "allow-flask"
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
}
# Output external IP addresses for all VMs
output "Web-server-VM-URLs" {
  value = {
            "http://${google_compute_instance.vm_africa_south1.network_interface[0].access_config[0].nat_ip}:5000" = "africa-south1",
            "http://${google_compute_instance.vm_asia_east2.network_interface[0].access_config[0].nat_ip}:5000" = "asia-east2",
            "http://${google_compute_instance.vm_asia_northeast1.network_interface[0].access_config[0].nat_ip}:5000" = "asia-northeast1",
            "http://${google_compute_instance.vm_asia_northeast2.network_interface[0].access_config[0].nat_ip}:5000" = "asia-northeast2",
            "http://${google_compute_instance.vm_asia_northeast3.network_interface[0].access_config[0].nat_ip}:5000" = "asia-northeast3",
            "http://${google_compute_instance.vm_asia_south1.network_interface[0].access_config[0].nat_ip}:5000" = "asia-south1",
            "http://${google_compute_instance.vm_asia_southeast2.network_interface[0].access_config[0].nat_ip}:5000" = "asia-southeast2",
            "http://${google_compute_instance.vm_australia_southeast1.network_interface[0].access_config[0].nat_ip}:5000" = "australia-southeast1",
            "http://${google_compute_instance.vm_australia_southeast2.network_interface[0].access_config[0].nat_ip}:5000" = "australia-southeast2",
            "http://${google_compute_instance.vm_europe_central2.network_interface[0].access_config[0].nat_ip}:5000" = "europe-central2",
            "http://${google_compute_instance.vm_europe_southwest1.network_interface[0].access_config[0].nat_ip}:5000" = "europe-southwest1",
            "http://${google_compute_instance.vm_europe_west2.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west2",
            "http://${google_compute_instance.vm_europe_west3.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west3",
            "http://${google_compute_instance.vm_europe_west4.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west4",
            "http://${google_compute_instance.vm_europe_west6.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west6",
            "http://${google_compute_instance.vm_northamerica_northeast1.network_interface[0].access_config[0].nat_ip}:5000" = "northamerica-northeast1",
            "http://${google_compute_instance.vm_northamerica_northeast2.network_interface[0].access_config[0].nat_ip}:5000" = "northamerica-northeast2",
            "http://${google_compute_instance.vm_southamerica_east1.network_interface[0].access_config[0].nat_ip}:5000" = "southamerica-east1",
            "http://${google_compute_instance.vm_southamerica_west1.network_interface[0].access_config[0].nat_ip}:5000" = "southamerica-west1",
            "http://${google_compute_instance.vm_us_east4.network_interface[0].access_config[0].nat_ip}:5000" = "us-east4",
            "http://${google_compute_instance.vm_us_east5.network_interface[0].access_config[0].nat_ip}:5000" = "us-east5",
            "http://${google_compute_instance.vm_us_south1.network_interface[0].access_config[0].nat_ip}:5000" = "us-south1",
            "http://${google_compute_instance.vm_us_west2.network_interface[0].access_config[0].nat_ip}:5000" = "us-west2"
    }
}