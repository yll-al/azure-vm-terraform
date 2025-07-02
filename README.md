# 🚀 Azure VM Terraform Setup

This project provisions a fully functional Azure Virtual Machine using Terraform. It's designed for **quick setup**, **clean structure**, and **modularity**, making it perfect for DevOps practice, testing, or production-ready infrastructure components.

---

## ✅ Features

- Ubuntu 22.04 LTS virtual machine
- Docker & NGINX pre-installed via `cloud-init`
- Configurable VM size, network, and credentials
- Modular structure (`network`, `nsg`, `vm`)
- Auto-generated public IP address
- NSG rules for SSH (22), HTTP (80), and Docker port (8081)
- Clean separation of configuration and variables

---

## 📦 Project Structure

```bash
.
├── main.tf                         # Root module invoking child modules
├── variables.tf                   # Variable definitions
├── terraform.tfvars               # User-defined values (excluded from Git)
├── terraform.tfvars.example       # Template for creating your own tfvars
├── outputs.tf                     # Output variables (e.g., public IP)
├── providers.tf                   # Azure provider config
├── versions.tf                    # Provider and Terraform version constraints
├── README.md                      # You’re reading it!
├── modules/
│   ├── network/                   # VNet and Subnet resources
│   ├── nsg/                       # Network Security Group (NSG) and rules
│   └── vm/                        # VM, NIC, public IP, cloud-init, etc.
│       └── cloud-init.sh          # Shell script to install Docker + NGINX


🚀 Quick Start

1. Clone the repo

git clone https://github.com/Ylli831/azure-vm-tf.git
cd azure-vm-tf

2. Set your variables

cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars to match your environment (e.g., SSH key path)

3. Deploy infrastructure

terraform init
terraform apply

🌐 Access the VM
Once Terraform finishes, it will output the public IP address of the VM.

SSH into your VM:
ssh <user>@<public_ip>

Open in your browser:
http://<public-ip>

NGINX runs inside Docker and maps to port 8081:

http://<public_ip>:8081

🛠 Configuration
Edit these in terraform.tfvars:

resource_group_name = "yll-devops"
location            = "westeurope"
vm_name             = "yll-vm"
vm_size             = "Standard_B1s"
admin_username      = "yll"
ssh_public_key_path = "~/.ssh/id_rsa.pub"

vnet_name     = "yll-vnet"
subnet_name   = "yll-subnet"
address_space = ["10.0.0.0/16"]
subnet_prefix = "10.0.1.0/24"

nsg_name = "yll-vm-nsg"

🔐 Security
Password authentication is disabled.

Only SSH (port 22), HTTP (80), and Docker/NGINX (8081) are allowed via NSG.

📤 Cleanup
To destroy all resources:
terraform destroy

📘 Notes
Make sure your SSH public key exists at the specified path.

Tested in Azure region westeurope.

👨‍💻 Author
Yll Aliu — DevOps Intern @ Solaborate HelloCare.ai

---

Let me know if you'd like help customizing this further or writing GitHub metadata like `LICENSE`, `CONTRIBUTING.md`, or `.github/workflows` for CI/CD.

