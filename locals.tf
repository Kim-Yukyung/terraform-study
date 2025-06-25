# Terraform 구성 내에서 재사용하거나 복잡한 표현식을 단순화하기 위한 로컬 값 정의

locals {
  name = "terraform"
}

locals {
  content = "${var.prefix} ${local.name}"
}
