data "google_cloud_run_service" "example" {
  name     = "cm-admin-suite"
  location = "us-central1"
  project  = var.project
}
