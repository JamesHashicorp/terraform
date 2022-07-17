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
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
  provisioner "local-exec" {
    command = "curl -X POST  http://ec2-34-243-231-141.eu-west-1.compute.amazonaws.com/api/v2/job_templates/9/launch/ -u "admin:Passw0rd" "
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
