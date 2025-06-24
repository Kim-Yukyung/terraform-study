resource "random_pet" "name" {
  # keepers: 값이 바뀌면 새로운 이름을 생성하게 만드는 트리거 역할
  keepers = {
    ami_id = timestamp()
  }
}

# random_password.password.result 값은 기본적으로 sensitive = true로 처리되어 출력되지 않음
resource "random_password" "password" {
  length           = var.isDB ? 16 : 10
  special          = var.isDB ? true : false
  override_special = "!#$%*?"
}
