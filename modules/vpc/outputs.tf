# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

# Public subnets
output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

# Private subnets
output "private_subnets" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

# Internet Gateway
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

# NAT Gateway
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

# Elastic IP for NAT
output "nat_eip_allocation_id" {
  description = "The Elastic IP allocation ID for the NAT Gateway"
  value       = aws_eip.nat.id
}

# Route Tables
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

# Security Groups
output "alb_sg_id" {
  description = "Security Group ID for the ALB"
  value       = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  description = "Security Group ID for ECS containers"
  value       = aws_security_group.ecs_sg.id
}
