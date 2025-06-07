# Terraform AWS Infrastructure Project

This project provisions a fully functional 3-tier AWS infrastructure using Terraform. It automates the setup of networking, compute, and database layers using infrastructure-as-code principles


![3tierawsreal](https://github.com/user-attachments/assets/d9380bf6-e3cf-43ca-baf4-46b9994c3fcf)




## What’s Included

VPC Setup

- Custom VPC with DNS hostnames enabled

- Public and Private Subnets across two Availability Zones

- Internet Gateway for public internet access

- NAT Gateway for secure outbound internet from private subnets

Security Group

- SSH access control (restricted to specific IPs)
  
- ALB access for web tier
  
- RDS access restricted to application layer

Compute Layer

- Launch Template for EC2 app instances
  
- Auto Scaling Group (ASG) for high availability

- Bastion Host for secure admin access to private instances

Networking

- Application Load Balancer (ALB) in public subnets
 
- Route Tables and associations for each subnet

Database

- RDS MySQL instance deployed in private subnets

- Encrypted and non-publicly accessible

Terraform Best Practices

- Modularized code structure
  
- Input variables defined in variables.tf
  
- Real values passed via terraform.tfvars
  
- Output values exported via outputs.tf

##  File Structure
``` bash
.
├── main.tf                  
├── variables.tf             
├── outputs.tf               
├── terraform.tfvars         
├── .gitignore               

├── modules/
│   ├── vpc/
│   │   ├── vpc.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── nat/
│   │   ├── nat.tf
│   │   └── variables.tf
│   ├── sg/
│   │   ├── sg.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── alb/
│   │   ├── alb.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── ec2.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── asg/
│   │   ├── asg.tf
│   │   └── variables.tf
│   └── rds/
│       ├── rds.tf
│       ├── variables.tf
│       └── outputs.tf

```

## Why This Project Is Useful
This project provides a production-ready, modular, and scalable AWS infrastructure setup using Terraform. It demonstrates best practices like Infrastructure as Code (IaC), reusable modules, secure network design (using public/private subnets), and automated resource provisioning with Auto Scaling and Load Balancing. It’s perfect for:

- Bootstrapping cloud-native applications

- Learning AWS infrastructure components hands-on

- Practicing Terraform modularization and collaboration

- Deploying resilient 3-tier architectures in real-world environments

How to Get Started
1. Clone the Repository
   
 ``` bash
git clone <url>
cd aws-infra-with-terraform
```
3. Configure AWS Credentials
Ensure your AWS credentials are configured locally via environment variables or the AWS CLI:

 ``` bash

aws configure
```
3. Customize Variables
Update terraform.tfvars and variables.tf to suit your environment 

4. Initialize Terraform
```bash
terraform init
```
5. Apply the Configuration
``` bash
terraform apply
```

## Help
- Terraform Docs: terraform.io/docs

- AWS Documentation: docs.aws.amazon.com

- Issues Tab: Raise an issue on this GitHub repo for help or improvements.


