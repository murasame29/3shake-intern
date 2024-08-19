resource "google_container_cluster" "default" {
  name = var.cluster_name

  location                 = var.region
  enable_l4_ilb_subsetting = true

  network    = var.network_name
  subnetwork = var.subnetwork_name

  initial_node_count = 1
  node_locations = var.node_locations
  
  node_config {
    machine_type = "e2-small"
  }

  deletion_protection = false
}