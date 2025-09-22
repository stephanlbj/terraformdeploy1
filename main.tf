provider "aws" {
  region = var.aws_region
}

# Module VPC
module "vpc" {
  source          = "./modules/vpc"
  project         = var.project
  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
  sg_ingress_private = var.sg_ingress_private
  sg_ingress_public  = var.sg_ingress_public
  sg_egress          = var.sg_egress
}

#  Module ALB
module "alb" {
  source         = "./modules/alb"
  project        = var.project
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id          # output du module VPC
  public_subnets = module.vpc.public_subnets  # output du module VPC
  alb_sg_id      = module.vpc.alb_sg_id       # output du module VPC
  target_group_port     = var.target_group_port
  target_group_protocol = "HTTP"
}
 

module "ecr" {
  source      = "./modules/ecr"
  project     = var.project
  environment = var.environment
  tags        = var.tags
}
 
 module "ecs" {
  source               = "./modules/ecs"
  project              = var.project
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  ecs_sg_id            = module.vpc.ecs_sg_id
  alb_target_group_arn = module.alb.target_group_arn
  container_name       = "nest-api"
  container_image      = "${module.ecr.repository_url}:latest"
  container_port       = 3000
  cpu                  = 256
  memory               = 512
  desired_count        = 2
}

module "iam_app_staging" {
  source      = "./modules/iam"
  repo_name   = var.github_repo_name
  branch      = var.github_branch
  environment = var.environment

  ssm_param_arn = "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/infra/${var.environment}/ecr_repo_url"
}
