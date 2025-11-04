
resource "aws_s3_bucket" "three_tier_webapp_state_bucket" {
  bucket        = "three-tier-webapp-terraform-state"
  force_destroy = true

  tags = {
    Name        = "ThreeTierWebAppStateBucket"
    Environment = "Workshop"
    Project     = "ThreeTierWebApp"
  }
}

resource "aws_dynamodb_table" "three_tier_webapp_lock_table" {
  name         = "three_tier_webapp_terraform_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "ThreeTierWebAppLockTable"
    Environment = "Workshop"
    Project     = "ThreeTierWebApp"
  }
}
