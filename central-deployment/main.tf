# Define the network
resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

# Subnetworks for each region

# Subnetwork for VM in us-east1
resource "google_compute_subnetwork" "subnet_us_east" {
  name          = "my-custom-subnet-east"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in us-central1 because us-central2 is unavilable
resource "google_compute_subnetwork" "subnet_us_central1" {
  name          = "my-custom-subnet-central1"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in us-west1
resource "google_compute_subnetwork" "subnet_us_west" {
  name          = "my-custom-subnet-west"
  ip_cidr_range = "10.0.3.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in europe-west1
resource "google_compute_subnetwork" "subnet_europe_west" {
  name          = "my-custom-subnet-europe-west"
  ip_cidr_range = "10.0.4.0/24"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in europe-north1
resource "google_compute_subnetwork" "subnet_europe_north" {
  name          = "my-custom-subnet-europe-north"
  ip_cidr_range = "10.0.5.0/24"
  region        = "europe-north1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in asia-east1
resource "google_compute_subnetwork" "subnet_asia_east" {
  name          = "my-custom-subnet-asia-east"
  ip_cidr_range = "10.0.6.0/24"
  region        = "asia-east1"
  network       = google_compute_network.vpc_network.id
}

# Subnetwork for VM in asia-southeast1
resource "google_compute_subnetwork" "subnet_asia_southeast" {
  name          = "my-custom-subnet-asia-southeast"
  ip_cidr_range = "10.0.7.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west3" {
  name          = "my-custom-subnet-us-west3"
  ip_cidr_range = "10.0.31.0/24"
  region        = "us-west3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west4" {
  name          = "my-custom-subnet-us-west4"
  ip_cidr_range = "10.0.32.0/24"
  region        = "us-west4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_me_central1" {
  name          = "my-custom-subnet-me-central1"
  ip_cidr_range = "10.0.33.0/24"
  region        = "me-central1"
  network       = google_compute_network.vpc_network.id
}


resource "google_compute_subnetwork" "subnet_me_west1" {
  name          = "my-custom-subnet-me-west1"
  ip_cidr_range = "10.0.35.0/24"
  region        = "me-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west8" {
  name          = "my-custom-subnet-europe-west8"
  ip_cidr_range = "10.0.36.0/24"
  region        = "europe-west8"
  network       = google_compute_network.vpc_network.id
}


resource "google_compute_subnetwork" "subnet_europe_west9" {
  name          = "my-custom-subnet-europe-west9"
  ip_cidr_range = "10.0.37.0/24"
  region        = "europe-west9"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west10" {
  name          = "my-custom-subnet-europe-west10"
  ip_cidr_range = "10.0.38.0/24"
  region        = "europe-west10"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west12" {
  name          = "my-custom-subnet-europe-west12"
  ip_cidr_range = "10.0.39.0/24"
  region        = "europe-west12"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_south1" {
  name          = "my-custom-subnet-northamerica-south1"
  ip_cidr_range = "10.0.40.0/24"
  region        = "northamerica-south1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_south2" {
  name          = "my-custom-subnet-asia-south2"
  ip_cidr_range = "10.0.41.0/24"
  region        = "asia-south2"
  network       = google_compute_network.vpc_network.id
}

# VM Instances for each region

# VM in us-east1
resource "google_compute_instance" "vm_us_east" {
  name         = "flask-vm-us-east"
  machine_type = "e2-micro"
  zone         = "us-east1-b"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_east.id

    access_config {
      # External IP address
    }
  }
}

# VM in us-central1
resource "google_compute_instance" "vm_us_central1" {
  name         = "flask-vm-us-central1"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_central1.id

    access_config {
      # External IP address
    }
  }
}

# VM in us-west1
resource "google_compute_instance" "vm_us_west" {
  name         = "flask-vm-us-west"
  machine_type = "e2-micro"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us_west.id

    access_config {
      # External IP address
    }
  }
}

# VM in europe-west1
resource "google_compute_instance" "vm_europe_west" {
  name         = "flask-vm-europe-west"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_west.id

    access_config {
      # External IP address
    }
  }
}

# VM in europe-north1
resource "google_compute_instance" "vm_europe_north" {
  name         = "flask-vm-europe-north"
  machine_type = "e2-micro"
  zone         = "europe-north1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe_north.id

    access_config {
      # External IP address
    }
  }
}

# VM in asia-east1
resource "google_compute_instance" "vm_asia_east" {
  name         = "flask-vm-asia-east"
  machine_type = "e2-micro"
  zone         = "asia-east1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_east.id

    access_config {
      # External IP address
    }
  }
}

# VM in asia-southeast1
resource "google_compute_instance" "vm_asia_southeast" {
  name         = "flask-vm-asia-southeast"
  machine_type = "e2-micro"
  zone         = "asia-southeast1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y python3-pip; pip3 install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia_southeast.id

    access_config {
      # External IP address
    }
  }
}

resource "google_compute_instance" "vm_us_west3" {
  name          = "flask-vm-us-west3"
  machine_type  = "e2-micro"
  zone          = "us-west3-a"
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
    subnetwork = google_compute_subnetwork.subnet_us_west3.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_us_west4" {
  name          = "flask-vm-us-west4"
  machine_type  = "e2-micro"
  zone          = "us-west4-a"
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
    subnetwork = google_compute_subnetwork.subnet_us_west4.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_me_central1" {
  name          = "flask-vm-me-central1"
  machine_type  = "e2-micro"
  zone          = "me-central1-a"
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
    subnetwork = google_compute_subnetwork.subnet_me_central1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}


resource "google_compute_instance" "vm_me_west1" {
  name          = "flask-vm-me-west1"
  machine_type  = "e2-micro"
  zone          = "me-west1-a"
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
    subnetwork = google_compute_subnetwork.subnet_me_west1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west8" {
  name          = "flask-vm-europe-west8"
  machine_type  = "e2-micro"
  zone          = "europe-west8-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west8.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west9" {
  name          = "flask-vm-europe-west9"
  machine_type  = "e2-micro"
  zone          = "europe-west9-b"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west9.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west10" {
  name          = "flask-vm-europe-west10"
  machine_type  = "e2-micro"
  zone          = "europe-west10-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west10.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west12" {
  name          = "flask-vm-europe-west12"
  machine_type  = "e2-micro"
  zone          = "europe-west12-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west12.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_northamerica_south1" {
  name          = "flask-vm-northamerica-south1"
  machine_type  = "e2-micro"
  zone          = "northamerica-south1-a"
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
    subnetwork = google_compute_subnetwork.subnet_northamerica_south1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_south2" {
  name          = "flask-vm-asia-south2"
  machine_type  = "e2-micro"
  zone          = "asia-south2-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_south2.id

    access_config {
      # Allocates an ephemeral external IP
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
           "http://${google_compute_instance.vm_us_east.network_interface[0].access_config[0].nat_ip}:5000" = "us-east",
            "http://${google_compute_instance.vm_us_central1.network_interface[0].access_config[0].nat_ip}:5000" = "us-central",
           "http://${google_compute_instance.vm_us_west.network_interface[0].access_config[0].nat_ip}:5000" = "us-west",
         "http://${google_compute_instance.vm_europe_west.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west",
           "http://${google_compute_instance.vm_europe_north.network_interface[0].access_config[0].nat_ip}:5000" = "europe-north",
            "http://${google_compute_instance.vm_asia_east.network_interface[0].access_config[0].nat_ip}:5000" = "asia-east",
            "http://${google_compute_instance.vm_asia_southeast.network_interface[0].access_config[0].nat_ip}:5000" = "asia-southeast",
           "http://${google_compute_instance.vm_us_west3.network_interface[0].access_config[0].nat_ip}:5000" = "us-west3",
            "http://${google_compute_instance.vm_us_west4.network_interface[0].access_config[0].nat_ip}:5000" = "us-west4",
            "http://${google_compute_instance.vm_me_central1.network_interface[0].access_config[0].nat_ip}:5000" = "me-central1",
            "http://${google_compute_instance.vm_me_west1.network_interface[0].access_config[0].nat_ip}:5000" = "me-west1",
            "http://${google_compute_instance.vm_europe_west8.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west8",
            "http://${google_compute_instance.vm_europe_west9.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west9",
            "http://${google_compute_instance.vm_europe_west10.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west10",
            "http://${google_compute_instance.vm_europe_west12.network_interface[0].access_config[0].nat_ip}:5000" = "europe-west12",
            "http://${google_compute_instance.vm_northamerica_south1.network_interface[0].access_config[0].nat_ip}:5000" = "northamerica-south1",
            "http://${google_compute_instance.vm_asia_south2.network_interface[0].access_config[0].nat_ip}:5000" = "asia-south2"
  }
}