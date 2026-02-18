terraform {
  backend "s3" {
    bucket         = "cloud-platform-tfstate-bucket"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "cloud-platform-tf-lock"
    encrypt        = true
  }
}
