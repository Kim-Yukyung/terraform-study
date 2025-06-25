# 최신 Amazon Linux 2 AMI ID를 자동으로 가져오기 위한 data 블록
data "aws_ami" "amzn2" {
  most_recent = true       # 가장 최신 AMI만 검색
  owners      = ["amazon"] # Amazon 공식 계정이 소유한 AMI만 사용

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

# 기본 VPC 생성
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# 기본 서브넷 생성
resource "aws_default_subnet" "default_az1" {
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "Default subnet for ap-northeast-2a"
  }
}
