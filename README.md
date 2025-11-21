# ☁️ Azure Infrastructure as Code (Terraform)

This repository contains Terraform modules and configurations for provisioning Azure infrastructure resources. The project follows Infrastructure as Code (IaC) and provides reusable modules for creating Azure Storage Accounts, Virtual Networks, Subnets, and monitoring resources with budget alerts.

## ✨ Technologies

- `Terraform` (>= 1.5.0)
- `Azure Resource Manager (azurerm)` provider (~> 4.0)
- `HTTP` provider (~> 3.0) for dynamic IP detection

## 🚀 Features

- **Resource Group Management**: Centralized resource grouping for Azure resources
- **Azure Data Lake Storage (ADLS)**: Configurable storage account with network security rules
- **Virtual Network & Subnet**: Network isolation with service endpoints for secure storage access
- **Network Security**: IP-based and subnet-based access controls for storage accounts
- **Cost Monitoring**: Budget alerts with email notifications for subscription spending
- **Modular Architecture**: Reusable Terraform modules for easy infrastructure composition
- **Dynamic IP Detection**: Automatically detects deployer's public IP for secure access configuration

## 🚦 Running the Project

### Prerequisites

1. **Azure CLI** installed and configured
2. **Terraform** (>= 1.5.0) installed
3. **Azure Subscription** with appropriate permissions
4. **Service Principal** or Azure CLI authentication configured

### Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Azure-IaC
   ```

2. Navigate to the environment directory:
   ```bash
   cd envs/dev
   ```

3. Configure your variables:
   - Copy `terraform.tfvars` and modify as needed
   - Create `terraform.local.tfvars` for sensitive values (e.g., `subscription_id`, `emails`)
   - Or set environment variables

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Review the execution plan:
   ```bash
   terraform plan
   ```

6. Apply the configuration:
   ```bash
   terraform apply
   ```

### Configuration

Key variables to configure in `terraform.tfvars`:
- `resource_group_name`: Name of the Azure resource group
- `adls_name`: Name of the storage account (must be globally unique)
- `location`: Azure region (default: "westeurope")
- `account_tier`: Storage account tier (Standard/Premium)
- `account_replication_type`: Replication type (LRS/GRS/ZRS)
- `access_tier`: Access tier (Hot/Cool/Cold)
- `sa_vnet_name`: Virtual network name
- `address_space`: VNet address space (CIDR notation)
- `subnet1_name`: Subnet name
- `address_prefixes`: Subnet address prefixes
- `service_endpoints`: List of service endpoints (e.g., ["Microsoft.Storage"])

Sensitive variables (set in `terraform.local.tfvars` or via environment variables):
- `subscription_id`: Azure subscription ID
- `emails`: List of email addresses for budget alerts

## 📝 Modules

### Resource Group (`modules/rg`)
Creates an Azure Resource Group for organizing related resources.

### Azure Data Lake Storage (`modules/adls`)
Provisions a storage account with:
- Configurable tier and replication settings
- Network rules (IP-based and subnet-based access)
- Automatic deployer IP detection for secure access

### Virtual Network (`modules/vnet`)
Creates a virtual network with specified address space.

### Subnet (`modules/subnet`)
Creates a subnet within the virtual network with service endpoints for secure Azure service access.

### Action Group (`modules/action_group`)
Configures email receivers for monitoring alerts and notifications.

### Budget Alert (`modules/alert`)
Sets up consumption budget alerts to monitor subscription spending with email notifications at 50% threshold.

## 🔒 Security

- Storage accounts are configured with network rules (default: Deny)
- Access is restricted to specified subnets and IP addresses
- Deployer's public IP is automatically detected and whitelisted
- Service endpoints enable secure access to Azure services without public internet exposure
