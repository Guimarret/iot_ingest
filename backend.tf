terraform {
  backend "s3" {
    bucket  = "terraform-iot-dev"
    key     = "iot/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}