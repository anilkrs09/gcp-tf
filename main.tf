terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  #credentials = file("terraform-anil.json")

  project = "terraform-anil"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-rule"
  network = "default"

  allow {
    ports    = ["80"]
    protocol = "tcp"
  }

  target_tags = ["allow-http"]

  priority = 1000
}

