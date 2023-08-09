
terraform {
  backend "gcs" {
    bucket = "croct-tech-tf-state"
    prefix = "stg/terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "4.27.0"
    }
  }
  required_version = ">= 0.14"
}

module "gke" {
  source     = "./modules/gke"
  project_id = var.project_id
  region     = var.region
}


