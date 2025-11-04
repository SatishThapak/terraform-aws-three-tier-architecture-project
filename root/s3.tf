resource "aws_s3_bucket" "project_code_bucket" {
  bucket = "three-tier-webapp-code-bucket" 

  tags = {
    Name        = "ThreeTierWebAppCodeBucket"
    Environment = "Workshop"
    Project     = "ThreeTierWebApp"
  }
}