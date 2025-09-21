resource "aws_ecr_repository" "this" {
  name = "${var.project}-${var.environment}-repo"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = merge(var.tags, {
    Name        = "${var.project}-${var.environment}-repo"
    Environment = var.environment
    Project     = var.project
  })
}
