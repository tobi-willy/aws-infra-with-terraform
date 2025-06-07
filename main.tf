module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
}

module "sg" {
  source            = "./modules/sg"
  ingress_ports     = var.ingress_ports
  app_ingress_ports = var.app_ingress_ports
  main_vpc          = module.vpc.main_vpc
}

module "ec2" {
  source          = "./modules/ec2"
  db_password     = var.db_password
  key_name        = var.key_name
  ssh_sg          = module.sg.ssh_sg
  app_sg          = module.sg.app_sg
  rds_sg          = module.sg.rds_sg
  db_subnet_group = module.rds.aws_db_subnet_group
  subnet_private  = module.vpc.subnet_private
  bastion_sg = module.sg.bastion_sg
  subnet_public = module.vpc.subnet_public
}

module "nat" {
  source           = "./modules/nat"
  main_vpc         = module.vpc.main_vpc
  subnet_public    = module.vpc.subnet_public
  private_subnet_a = module.vpc.private_subnet_a
  private_subnet_b = module.vpc.private_subnet_b
}

module "rds" {
  source         = "./modules/rds"
  private_subnet = module.vpc.private_subnet
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.main_vpc
  public_subnets = module.vpc.public_subnet
  ssh_sg_id      = module.sg.ssh_sg

}

module "asg" {
  source             = "./modules/asg"
  target_group_arn   = module.alb.web_tg_arn
  launch_template_id = module.ec2.launch_template_id
  public_subnets     = module.vpc.pub_subnet
}