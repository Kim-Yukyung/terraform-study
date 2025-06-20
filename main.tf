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

resource "local_file" "HelloWorld2" {
  content  = local_file.HelloWorld.content
  filename = "${path.module}/HelloWorld2.txt"

  depends_on = [local_file.HelloWorld]
}
