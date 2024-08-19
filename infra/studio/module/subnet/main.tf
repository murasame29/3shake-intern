resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network_name
  secondary_ip_range {
    range_name    = "pod-ip-range"
    ip_cidr_range = var.pod_ip_range
  }
  secondary_ip_range {
    range_name    = "svc-ip-range"
    ip_cidr_range = var.svc_ip_range
  }
}
