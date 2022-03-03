resource "google_project_service" "project" {
  project = "jesper-tfcloud-testing"
  service = "compute.googleapis.com"

  depends_on = [ google_project_service.project2 ]

  disable_dependent_services = true
}

resource "google_project_service" "project2" {
  project = "jesper-tfcloud-testing"
  service = "cloudresourcemanager.googleapis.com"

  disable_dependent_services = true
}