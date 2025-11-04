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
