locals {
    name = "terraform"
}

locals {
    content = "${var.prefix} ${local.name}"
}
