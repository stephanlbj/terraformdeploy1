resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["2b18947a6a9fc7764fd8b5fb18a863b0c6dac24f"] # ton thumbprint
}

resource "aws_iam_role" "github" {
  name = "GitHubActionsAppRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.github.arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringLike = {
          # Restriction sur repo + branche
          "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo_name}:ref/heads/${var.github_branch}"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "ssm_access" {
  role = aws_iam_role.github.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["ssm:GetParameter"]
      Resource = "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/infra/${var.github_branch}/ecr_repo_url"
    }]
  })
}


