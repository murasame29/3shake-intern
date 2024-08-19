output "subnetwork_name" {
  value = google_compute_subnetwork.network-with-private-secondary-ip-ranges.name
}

output "secondary_ip_range" {
  value = google_compute_subnetwork.network-with-private-secondary-ip-ranges.secondary_ip_range
}