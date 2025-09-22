resource "aws_iam_role" "github" {
  name = "GitHubActionsAppRole-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.repo_name}:ref/heads/${var.branch}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "ssm_access" {
  role = aws_iam_role.github.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter"
        ]
        Resource = var.ssm_param_arn
      }
    ]
  })
}

