terraform {
  backend "gcs" {
    bucket  = "terraform-sp-dg-noah-dev"
    prefix = "atlantis_poc"
  }
}

variable "instance_size" { default = "xs" }

provider "google" {
  version = "2.2.0"
  project = "sp-dg-noah-dev-ayu3"
}

module "cluster" {
  source       = "modules/gke"
  name         = "atlantis-created"
  machine_size = "${var.instance_size}"
}
