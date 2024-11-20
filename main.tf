# Define the network
resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-network"
  auto_create_subnetworks = false  # Set to false when defining subnetworks manually
  mtu                     = 1460
}
# Subnetworks for each region
resource "google_compute_subnetwork" "subnet_asia_east1" {
  name          = "my-custom-subnet-asia-east1"
  ip_cidr_range = "10.1.0.0/24"
  region        = "asia-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_east2" {
  name          = "my-custom-subnet-asia-east2"
  ip_cidr_range = "10.2.0.0/24"
  region        = "asia-east2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast1" {
  name          = "my-custom-subnet-asia-northeast1"
  ip_cidr_range = "10.3.0.0/24"
  region        = "asia-northeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast2" {
  name          = "my-custom-subnet-asia-northeast2"
  ip_cidr_range = "10.4.0.0/24"
  region        = "asia-northeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast3" {
  name          = "my-custom-subnet-asia-northeast3"
  ip_cidr_range = "10.5.0.0/24"
  region        = "asia-northeast3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_south1" {
  name          = "my-custom-subnet-asia-south1"
  ip_cidr_range = "10.6.0.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_south2" {
  name          = "my-custom-subnet-asia-south2"
  ip_cidr_range = "10.7.0.0/24"
  region        = "asia-south2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_southeast1" {
  name          = "my-custom-subnet-asia-southeast1"
  ip_cidr_range = "10.8.0.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_southeast2" {
  name          = "my-custom-subnet-asia-southeast2"
  ip_cidr_range = "10.9.0.0/24"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_australia_southeast1" {
  name          = "my-custom-subnet-australia-southeast1"
  ip_cidr_range = "10.10.0.0/24"
  region        = "australia-southeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_australia_southeast2" {
  name          = "my-custom-subnet-australia-southeast2"
  ip_cidr_range = "10.11.0.0/24"
  region        = "australia-southeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_central2" {
  name          = "my-custom-subnet-europe-central2"
  ip_cidr_range = "10.12.0.0/24"
  region        = "europe-central2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_north1" {
  name          = "my-custom-subnet-europe-north1"
  ip_cidr_range = "10.13.0.0/24"
  region        = "europe-north1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west1" {
  name          = "my-custom-subnet-europe-west1"
  ip_cidr_range = "10.14.0.0/24"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west2" {
  name          = "my-custom-subnet-europe-west2"
  ip_cidr_range = "10.15.0.0/24"
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west3" {
  name          = "my-custom-subnet-europe-west3"
  ip_cidr_range = "10.16.0.0/24"
  region        = "europe-west3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west4" {
  name          = "my-custom-subnet-europe-west4"
  ip_cidr_range = "10.17.0.0/24"
  region        = "europe-west4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west6" {
  name          = "my-custom-subnet-europe-west6"
  ip_cidr_range = "10.18.0.0/24"
  region        = "europe-west6"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_northeast1" {
  name          = "my-custom-subnet-northamerica-northeast1"
  ip_cidr_range = "10.19.0.0/24"
  region        = "northamerica-northeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_northeast2" {
  name          = "my-custom-subnet-northamerica-northeast2"
  ip_cidr_range = "10.20.0.0/24"
  region        = "northamerica-northeast2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_southamerica_east1" {
  name          = "my-custom-subnet-southamerica-east1"
  ip_cidr_range = "10.21.0.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_southamerica_west1" {
  name          = "my-custom-subnet-southamerica-west1"
  ip_cidr_range = "10.22.0.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_central1" {
  name          = "my-custom-subnet-us-central1"
  ip_cidr_range = "10.23.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_east1" {
  name          = "my-custom-subnet-us-east1"
  ip_cidr_range = "10.24.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_east4" {
  name          = "my-custom-subnet-us-east4"
  ip_cidr_range = "10.25.0.0/24"
  region        = "us-east4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west1" {
  name          = "my-custom-subnet-us-west1"
  ip_cidr_range = "10.26.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west2" {
  name          = "my-custom-subnet-us-west2"
  ip_cidr_range = "10.27.0.0/24"
  region        = "us-west2"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west3" {
  name          = "my-custom-subnet-us-west3"
  ip_cidr_range = "10.28.0.0/24"
  region        = "us-west3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_west4" {
  name          = "my-custom-subnet-us-west4"
  ip_cidr_range = "10.29.0.0/24"
  region        = "us-west4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_us_south1" {
  name          = "my-custom-subnet-us-south1"
  ip_cidr_range = "10.30.0.0/24"
  region        = "us-south1"
  network       = google_compute_network.vpc_network.id
}

# Additional 11 Subnetworks for Remaining Regions
resource "google_compute_subnetwork" "subnet_africa_south1" {
  name          = "my-custom-subnet-africa-south1"
  ip_cidr_range = "10.31.0.0/24"
  region        = "africa-south1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_central1" {
  name          = "my-custom-subnet-asia-central1"
  ip_cidr_range = "10.32.0.0/24"
  region        = "asia-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_northeast4" {
  name          = "my-custom-subnet-asia-northeast4"
  ip_cidr_range = "10.33.0.0/24"
  region        = "asia-northeast4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_asia_southeast3" {
  name          = "my-custom-subnet-asia-southeast3"
  ip_cidr_range = "10.34.0.0/24"
  region        = "asia-southeast3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_australia_northeast1" {
  name          = "my-custom-subnet-australia-northeast1"
  ip_cidr_range = "10.35.0.0/24"
  region        = "australia-northeast1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_east1" {
  name          = "my-custom-subnet-europe-east1"
  ip_cidr_range = "10.36.0.0/24"
  region        = "europe-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west5" {
  name          = "my-custom-subnet-europe-west5"
  ip_cidr_range = "10.37.0.0/24"
  region        = "europe-west5"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west8" {
  name          = "my-custom-subnet-europe-west8"
  ip_cidr_range = "10.38.0.0/24"
  region        = "europe-west8"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_europe_west10" {
  name          = "my-custom-subnet-europe-west10"
  ip_cidr_range = "10.39.0.0/24"
  region        = "europe-west10"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_northamerica_northeast3" {
  name          = "my-custom-subnet-northamerica-northeast3"
  ip_cidr_range = "10.40.0.0/24"
  region        = "northamerica-northeast3"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_southamerica_west2" {
  name          = "my-custom-subnet-southamerica-west2"
  ip_cidr_range = "10.41.0.0/24"
  region        = "southamerica-west2"
  network       = google_compute_network.vpc_network.id
}

# VM Instances for each region
resource "google_compute_instance" "vm_asia_east1" {
  name          = "flask-vm-asia-east1"
  machine_type  = "e2-micro"
  zone          = "asia-east1-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_east1.id

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
    sudo apt-get install -y python3-pip
    pip3 install flask
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

resource "google_compute_instance" "vm_asia_southeast1" {
  name          = "flask-vm-asia-southeast1"
  machine_type  = "e2-micro"
  zone          = "asia-southeast1-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_southeast1.id

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

resource "google_compute_instance" "vm_europe_north1" {
  name          = "flask-vm-europe-north1"
  machine_type  = "e2-micro"
  zone          = "europe-north1-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_north1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west1" {
  name          = "flask-vm-europe-west1"
  machine_type  = "e2-micro"
  zone          = "europe-west1-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west1.id

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

resource "google_compute_instance" "vm_us_central1" {
  name          = "flask-vm-us-central1"
  machine_type  = "e2-micro"
  zone          = "us-central1-a"
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
    subnetwork = google_compute_subnetwork.subnet_us_central1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_us_east1" {
  name          = "flask-vm-us-east1"
  machine_type  = "e2-micro"
  zone          = "us-east1-a"
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
    subnetwork = google_compute_subnetwork.subnet_us_east1.id

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

resource "google_compute_instance" "vm_us_west1" {
  name          = "flask-vm-us-west1"
  machine_type  = "e2-micro"
  zone          = "us-west1-a"
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
    subnetwork = google_compute_subnetwork.subnet_us_west1.id

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

# Additional 11 VM Instances for Remaining Regions
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

resource "google_compute_instance" "vm_asia_central1" {
  name          = "flask-vm-asia-central1"
  machine_type  = "e2-micro"
  zone          = "asia-central1-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_central1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_northeast4" {
  name          = "flask-vm-asia-northeast4"
  machine_type  = "e2-micro"
  zone          = "asia-northeast4-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_northeast4.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_asia_southeast3" {
  name          = "flask-vm-asia-southeast3"
  machine_type  = "e2-micro"
  zone          = "asia-southeast3-a"
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
    subnetwork = google_compute_subnetwork.subnet_asia_southeast3.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_australia_northeast1" {
  name          = "flask-vm-australia-northeast1"
  machine_type  = "e2-micro"
  zone          = "australia-northeast1-a"
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
    subnetwork = google_compute_subnetwork.subnet_australia_northeast1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_east1" {
  name          = "flask-vm-europe-east1"
  machine_type  = "e2-micro"
  zone          = "europe-east1-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_east1.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_europe_west5" {
  name          = "flask-vm-europe-west5"
  machine_type  = "e2-micro"
  zone          = "europe-west5-a"
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
    subnetwork = google_compute_subnetwork.subnet_europe_west5.id

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

resource "google_compute_instance" "vm_northamerica_northeast3" {
  name          = "flask-vm-northamerica-northeast3"
  machine_type  = "e2-micro"
  zone          = "northamerica-northeast3-a"
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
    subnetwork = google_compute_subnetwork.subnet_northamerica_northeast3.id

    access_config {
      # Allocates an ephemeral external IP
    }
  }
}

resource "google_compute_instance" "vm_southamerica_west2" {
  name          = "flask-vm-southamerica-west2"
  machine_type  = "e2-micro"
  zone          = "southamerica-west2-a"
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
    subnetwork = google_compute_subnetwork.subnet_southamerica_west2.id

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
    asia_east1                = "http://${google_compute_instance.vm_asia_east1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_east2                = "http://${google_compute_instance.vm_asia_east2.network_interface[0].access_config[0].nat_ip}:5000",
    asia_northeast1           = "http://${google_compute_instance.vm_asia_northeast1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_northeast2           = "http://${google_compute_instance.vm_asia_northeast2.network_interface[0].access_config[0].nat_ip}:5000",
    asia_northeast3           = "http://${google_compute_instance.vm_asia_northeast3.network_interface[0].access_config[0].nat_ip}:5000",
    asia_south1               = "http://${google_compute_instance.vm_asia_south1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_south2               = "http://${google_compute_instance.vm_asia_south2.network_interface[0].access_config[0].nat_ip}:5000",
    asia_southeast1           = "http://${google_compute_instance.vm_asia_southeast1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_southeast2           = "http://${google_compute_instance.vm_asia_southeast2.network_interface[0].access_config[0].nat_ip}:5000",
    australia_southeast1      = "http://${google_compute_instance.vm_australia_southeast1.network_interface[0].access_config[0].nat_ip}:5000",
    australia_southeast2      = "http://${google_compute_instance.vm_australia_southeast2.network_interface[0].access_config[0].nat_ip}:5000",
    europe_central2           = "http://${google_compute_instance.vm_europe_central2.network_interface[0].access_config[0].nat_ip}:5000",
    europe_north1             = "http://${google_compute_instance.vm_europe_north1.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west1              = "http://${google_compute_instance.vm_europe_west1.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west2              = "http://${google_compute_instance.vm_europe_west2.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west3              = "http://${google_compute_instance.vm_europe_west3.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west4              = "http://${google_compute_instance.vm_europe_west4.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west6              = "http://${google_compute_instance.vm_europe_west6.network_interface[0].access_config[0].nat_ip}:5000",
    northamerica_northeast1   = "http://${google_compute_instance.vm_northamerica_northeast1.network_interface[0].access_config[0].nat_ip}:5000",
    northamerica_northeast2   = "http://${google_compute_instance.vm_northamerica_northeast2.network_interface[0].access_config[0].nat_ip}:5000",
    southamerica_east1        = "http://${google_compute_instance.vm_southamerica_east1.network_interface[0].access_config[0].nat_ip}:5000",
    southamerica_west1        = "http://${google_compute_instance.vm_southamerica_west1.network_interface[0].access_config[0].nat_ip}:5000",
    us_central1               = "http://${google_compute_instance.vm_us_central1.network_interface[0].access_config[0].nat_ip}:5000",
    us_east1                  = "http://${google_compute_instance.vm_us_east1.network_interface[0].access_config[0].nat_ip}:5000",
    us_east4                  = "http://${google_compute_instance.vm_us_east4.network_interface[0].access_config[0].nat_ip}:5000",
    us_west1                  = "http://${google_compute_instance.vm_us_west1.network_interface[0].access_config[0].nat_ip}:5000",
    us_west2                  = "http://${google_compute_instance.vm_us_west2.network_interface[0].access_config[0].nat_ip}:5000",
    us_west3                  = "http://${google_compute_instance.vm_us_west3.network_interface[0].access_config[0].nat_ip}:5000",
    us_west4                  = "http://${google_compute_instance.vm_us_west4.network_interface[0].access_config[0].nat_ip}:5000",
    us_south1                 = "http://${google_compute_instance.vm_us_south1.network_interface[0].access_config[0].nat_ip}:5000",
    africa_south1            = "http://${google_compute_instance.vm_africa_south1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_central1             = "http://${google_compute_instance.vm_asia_central1.network_interface[0].access_config[0].nat_ip}:5000",
    asia_northeast4           = "http://${google_compute_instance.vm_asia_northeast4.network_interface[0].access_config[0].nat_ip}:5000",
    asia_southeast3           = "http://${google_compute_instance.vm_asia_southeast3.network_interface[0].access_config[0].nat_ip}:5000",
    australia_northeast1      = "http://${google_compute_instance.vm_australia_northeast1.network_interface[0].access_config[0].nat_ip}:5000",
    europe_east1              = "http://${google_compute_instance.vm_europe_east1.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west5              = "http://${google_compute_instance.vm_europe_west5.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west8              = "http://${google_compute_instance.vm_europe_west8.network_interface[0].access_config[0].nat_ip}:5000",
    europe_west10             = "http://${google_compute_instance.vm_europe_west10.network_interface[0].access_config[0].nat_ip}:5000",
    northamerica_northeast3   = "http://${google_compute_instance.vm_northamerica_northeast3.network_interface[0].access_config[0].nat_ip}:5000",
    southamerica_west2        = "http://${google_compute_instance.vm_southamerica_west2.network_interface[0].access_config[0].nat_ip}:5000"
  }
}
