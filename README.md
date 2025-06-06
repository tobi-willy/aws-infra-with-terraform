Terraform AWS Infrastructure Project

This project provisions a fully functional 3-tier AWS infrastructure using Terraform. It includes a VPC with public and private subnets, a NAT Gateway, EC2 application instances, an RDS database, an Auto Scaling Group (ASG), and an Application Load Balancer (ALB) — all defined as infrastructure-as-code.

<img width="520" alt="image" src="https://github.com/user-attachments/assets/23b7d83f-4339-477c-b93a-3c108b4eb0be" />



What’s Included

- VPC with CIDR block and DNS support
- Public and Private Subnets across two Availability Zones
- Internet Gateway and NAT Gateway for public/private traffic routing
- Security Groups for SSH, ALB, and RDS access control
- Application Load Balancer (ALB) in public subnets
- Launch Template and Auto Scaling Group (ASG) for app EC2 instances
- RDS MySQL Instance deployed in private subnets
- **Parameterization** using `variables.tf` and `terraform.tfvars`

##  File Structure
-vpc.tf # VPC, subnets, route tables
-nat.tf # NAT Gateway & Elastic IP
-sg.tf # Security groups
-rds.tf # RDS instance config
-asg.tf # Launch Template, ALB, ASG
-outputs.tf # Output values
-variables.tf # Input variables
-terraform.tfvars # Variable values
-.gitignore # Ignored files and folders
