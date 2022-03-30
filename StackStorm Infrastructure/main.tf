terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project     = var.projectId
  region      = var.region
  zone        = var.zone
  
}

