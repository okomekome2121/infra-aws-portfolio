terraform {
  backend "s3" {
    bucket = "okome-terraform-state-bucket"
    key    = "env:/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
