module "mypw1" {
  source = "../modules/terraform-random-pwgen"
}

module "mypw2" {
  source = "../modules/terraform-random-pwgen"
  isDB   = true
}

provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias  = "seoul"
  region = "ap-northeast-2"
}

module "ec2_california" {
  source = "../modules/terraform-aws-ec2"
}

module "ec2_seoul" {
  source = "../modules/terraform-aws-ec2"
  providers = {
    aws = aws.seoul
  }
  instance_type = "m5.large"
}
