variable "repo_name" {
  type = string
}

variable "branch" {
  type = string
}

variable "environment" {
  type = string
}

variable "ssm_param_arn" {
  type = string
}


variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}


variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "github_branch" {
  description = "Nom de la branche GitHub pour OIDC"
  type        = string
}

variable "github_repo_name" {
  description = "Nom du repository GitHub pour OIDC"
  type        = string
}