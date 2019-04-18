variable "name" {}
variable "machine_size" {}

resource "google_container_cluster" "kubernetes" {
  name               = "${var.name}"
  zone               = "us-central1-a"
  initial_node_count = 2
  min_master_version = "1.12.6-gke.10"
  node_version       = "1.12.6-gke.10"

  node_config {
    machine_type = "${lookup(var.machines, var.machine_size, "xs")}"
    oauth_scopes = [
      # https://developers.google.com/identity/protocols/googlescopes
      # default gce instances scopes
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      # non default permissions
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management",
      "https://www.googleapis.com/auth/datastore",
    ]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
