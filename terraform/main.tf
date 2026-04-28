# Define the required providers for this project
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider with the API token
provider "digitalocean" {
  token = var.do_token
}

# Create a DigitalOcean Kubernetes (DOKS) Cluster
resource "digitalocean_kubernetes_cluster" "primary" {
  name    = var.cluster_name
  region  = var.region
  version = "1.35.1-do.3" # Specifies the Kubernetes version

  # Define the worker nodes (Virtual Machines) configuration
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb" # Size of each node (RAM/CPU)
    node_count = 2             # Number of nodes for high availability
    auto_scale = false
  }
}

data "digitalocean_kubernetes_versions" "current" {}

output "available_version" {
  value = data.digitalocean_kubernetes_versions.current.latest_version
}