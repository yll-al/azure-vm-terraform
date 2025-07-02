# Azure VM Terraform Deployment

This project provisions an Azure virtual machine using Terraform with modular best practices.

## Structure

- `main.tf` – Root orchestration
- `modules/` – Contains reusable modules
- `terraform.tfvars.example` – Example of variable input
- `cloud-init.sh` – Startup script to install Git, Docker, and NGINX
