resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = var.repo_name
  description   = var.description
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}