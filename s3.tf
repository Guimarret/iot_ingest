resource "aws_s3_bucket" "terraform" {
  bucket = "terraform-iot-${var.environment}"

  tags = {
    Name        = "terraform"
    Environment = var.environment
    Purpose     = "Terraform state storage"
  }
}

resource "aws_s3_bucket_versioning" "terraform" {
  bucket = aws_s3_bucket.terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform" {
  bucket = aws_s3_bucket.terraform.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
