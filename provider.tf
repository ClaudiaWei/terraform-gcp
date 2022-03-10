terraform {
  backend "gcs" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.00"
    }
  }
}

provider "google" {
  project = "artful-talon-343315"
  region  = var.region
}
