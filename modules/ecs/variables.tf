variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (staging, preprod, prod)"
}

variable "vpc_id" {
  type        = string
}

variable "private_subnets" {
  type        = list(string)
}

variable "ecs_sg_id" {
  type        = string
  description = "Security group for ECS tasks"
}

variable "alb_target_group_arn" {
  type        = string
}

variable "container_name" {
  type        = string
}

variable "container_image" {
  type        = string
  description = "Full ECR image URI"
}

variable "container_port" {
  type        = number
  default     = 3000
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 2
}
