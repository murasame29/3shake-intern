variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnetwork_name" {
  type = string
}

variable "secondary_ip_range" {
  type = list(any)
}

variable "node_locations" {
  type = list(string)
}