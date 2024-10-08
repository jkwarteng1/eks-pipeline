// terraform/outputs.tf
output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "kubeconfig" {
  description = "Kubeconfig file content for the EKS cluster."
  value       = module.eks.kubeconfig
}

