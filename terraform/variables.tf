variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean Region"
  type        = string
  default     = "sgp1" # Singapore 
}

variable "cluster_name" {
  description = "Name of the Kubernetes Cluster"
  type        = string
  default     = "gaming-platform-cluster"
}