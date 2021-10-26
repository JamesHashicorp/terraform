provider "google" {
  project = var.projectid
  region  = "us-east1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-customer"
  machine_type = var.vm_type
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}