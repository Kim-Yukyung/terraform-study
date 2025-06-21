variable "file_name" {
  default = "step0.txt"
}

variable "string" {
  type        = string
  description = "var string"
  default     = "string"
}

variable "number" {
  type    = number
  default = 123
}

variable "boolean" {
  default = true
}

variable "list" {
  default = [
    "google",
    "vmware",
    "amazon",
    "microsoft"
  ]
}

variable "map" {
  default = {
    aws   = "amazon",
    azure = "microsoft",
    gcp   = "google"
  }
}

variable "set" {
  type = set(string)
  default = [
    "google",
    "vmware",
    "amazon",
    "microsoft"
  ]
}

variable "object" {
  type = object({ name = string, age = number })
  default = {
    name = "John",
    age  = 20
  }
}

variable "tuple" {
  type    = tuple([string, number, bool])
  default = ["John", 20, true]
}

variable "ingress_rules" {
  # 객체 타입 리스트 변수 선언
  type = list(object({
    port        = number,
    description = optional(string),
    protocol    = optional(string, "tcp"),
  }))

  default = [
    {
      port        = 80,
      description = "web",
    },
    {
      port     = 53,
      protocol = "udp"
    }
  ]
}

variable "password" {
  sensitive = true
}

# 우선순위 확인 예제
variable "var" {
  default = "default"
}

variable "prefix" {
  default = "hello"
}
