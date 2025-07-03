output "vm_public_ip" {
  value = module.vm.vm_public_ip_address
}

output "vm_public_ip_id" {
  value = module.vm.vm_public_ip_id
}

output "network_subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.nsg.nsg_id
}

output "kube_config" {
  description = "Kubeconfig for accessing the AKS cluster"
  value       = module.aks.kube_config
  sensitive   = true
}
