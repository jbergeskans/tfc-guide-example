provider "google" {
  region = var.region
}

resource "google_service_account" "default" {
  project      = "jesper-tfcloud-testing"
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = "jespertest"
  machine_type = "f1-micro"
  zone         = "europe-west4a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}