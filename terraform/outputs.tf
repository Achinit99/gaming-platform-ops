output "cluster_id" {
  value = digitalocean_kubernetes_cluster.primary.id
}

output "kubernetes_host" {
  value = digitalocean_kubernetes_cluster.primary.endpoint
}

# Cluster config 
output "kube_config" {
  value     = digitalocean_kubernetes_cluster.primary.kube_config[0].raw_config
  sensitive = true
}