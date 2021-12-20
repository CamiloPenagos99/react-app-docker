terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.66"
    }
  }

  backend "gcs" {
    bucket = "cm-tf-admin-state"
    prefix = "/cm-admin-suite"
  }
}

provider "google" {
  project = var.project
  region  = "us-central1"
  zone    = "us-central1-c"
}
