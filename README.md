# Project Overview
This project aims to provide a comprehensive Terraform configuration for deploying and managing infrastructure as code. It helps automate the provisioning of cloud resources and ensures consistency across different environments.

# Architecture
The architecture of this project is based on modular Terraform configurations that enable reusability and scalability. The core components are organized into separate modules, each responsible for a specific aspect of the infrastructure.

# Modules Documentation
- **VPC Module**: Sets up a Virtual Private Cloud (VPC) with subnets, route tables, and internet gateways.
- **EC2 Module**: Provisions Amazon EC2 instances with customizable configurations for AMI, instance type, and security groups.
- **RDS Module**: Deploys an Amazon RDS database instance with configurations for backup, scaling, and security.

# Environment Configuration
Each environment (e.g., development, staging, production) has its own configuration file. Ensure that you set the necessary variables like region and instance sizes in these files.

# Prerequisites
- Terraform version 1.0 or higher
- AWS account with necessary permissions
- AWS CLI configured with proper access credentials

# Getting Started Guide
1. Clone the repository:
   ```bash
   git clone https://github.com/Harsh7209/terraform-capstone.git
   cd terraform-capstone
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Plan the deployment:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

# Usage Examples
## Deploying a VPC
```hcl
module "vpc" {
  source = "./modules/vpc"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
}
```

## Provisioning EC2 Instances
```hcl
module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
  ami           = "ami-0c55b159cbfafe01e"
}
```

# Best Practices
- Always use version control for your Terraform code.
- Implement state file management to handle concurrent modifications.
- Review and validate your configurations before applying changes.
- Document any changes made to the infrastructure for future reference.