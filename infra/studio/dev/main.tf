terraform {
  required_version = "= 1.9.4"
    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.41.0"
    }
  }
  backend "gcs" {
    bucket = "sreake-summer-intern-murasame29"
  }
}

provider "google" {
  project = "sreake-intern"
}

variable "project_id" {
  default = "sreake-intern"
}

variable "unique" {
  default = "murasame29"
}

variable "region" {
  default = "asia-northeast1"
}

module "vcp" {
  source = "../module/network"

  project_id = var.project_id
  network_name = "argocd-studio-network-murasame29"
}

module "subnet" {
  source = "../module/subnet"

  network_name = module.vcp.network_name
  subnet_name = "argocd-studio-subnet-murasame29"
  ip_cidr_range = "10.10.0.0/24"
  region = var.region
  svc_ip_range = "172.16.0.0/16"
  pod_ip_range = "172.17.0.0/16"
}

module "gke" {
  source = "../module/gke"

  cluster_name = "argocd-cluster-murasame29"
  region = var.region
  network_name = module.vcp.network_name
  node_locations = [
    "asia-northeast1-a",
  ]
  subnetwork_name = module.subnet.subnetwork_name
  secondary_ip_range = module.subnet.secondary_ip_range
}

module "artifact_registry" {
  source = "../module/gar"

  region = var.region
  repo_name = "intern-repo-murasame29"
  description = "3 shake intern image repository"
}