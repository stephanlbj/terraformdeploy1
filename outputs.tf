# VPC
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# Subnets
output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

# Security Groups
output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = module.vpc.alb_sg_id
}

output "ecs_sg_id" {
  description = "Security Group ID for ECS"
  value       = module.vpc.ecs_sg_id
}

# NAT Gateway
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

# Internet Gateway
output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.internet_gateway_id
}

# Route Tables
output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "Private Route Table ID"
  value       = module.vpc.private_route_table_id
}


# ECR
output "repository_url" {
  value = module.ecr.repository_url
}

# ECS
output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "ecs_task_image" {
  value = module.ecs.ecs_task_image
}
