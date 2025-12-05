module "aws_vpc" {
  source = "../modules/vpc"

  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}

module "nat_gateway" {
  source = "../modules/nat_gateway"
  project_name                = var.project_name
  vpc_id                      = module.aws_vpc.vpc_id
  internet_gateway_id         = module.aws_vpc.internet_gateway_id
  public_subnet_az1_id        = module.aws_vpc.public_subnets[0]
  public_subnet_az2_id        = module.aws_vpc.public_subnets[1]
  private_app_subnet_az1_id   = module.aws_vpc.private_app_subnets[0]
  private_app_subnet_az2_id   = module.aws_vpc.private_app_subnets[1]
  private_data_subnet_az1_id  = module.aws_vpc.private_db_subnets[0]
  private_data_subnet_az2_id  = module.aws_vpc.private_db_subnets[1]
}

module "security_groups" {
  source       = "../modules/security_groups"
  project_name = var.project_name
  vpc_id       = module.aws_vpc.vpc_id
}

module "rds_instance" {
  source = "./modules/rds_instance"

  project_name          = var.project_name
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  db_username           = var.db_username
  db_password           = var.db_password
  db_name               = var.db_name
  backup_retention_days = var.backup_retention_days

  private_db_sg_id      = module.security_groups.private_db_sg_id
  db_subnet_group_name  = aws_db_subnet_group.db_subnet_group.name
}
