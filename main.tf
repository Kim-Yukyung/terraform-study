# Terraform 실행에 필요한 최소 버전과 사용할 provider 정의

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Terraform 상태 파일(.tfstate)을 로컬 디스크의 특정 경로에 저장하도록 설정
  backend "local" {
    path = "state/terraform.tfstate"
  }
}
