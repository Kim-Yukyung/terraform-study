terraform {
  required_version = ">= 1.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }

  backend "local" {
    path = "state/terraform.tfstate"
  }
}

resource "local_file" "HelloWorld" {
  content  = "Hello, World!"
  filename = "${path.module}/HelloWorld.txt"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
