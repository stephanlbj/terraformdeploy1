bucket         = "my-terraform-states-nest-api-2"
key            = "nest-api/staging/terraform.tfstate"
region         = "eu-north-1"
dynamodb_table = "terraform-locks"
encrypt        = true