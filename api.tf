resource "google_project_service" "project" {
  project = "jesper-tfcloud-testing"
  service = "compute.googleapis.com"

  disable_dependent_services = true
}