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
  filename = "${path.module}/resource/HelloWorld.txt"
}

resource "local_file" "HelloWorld2" {
  content  = local_file.HelloWorld.content
  filename = "${path.module}/resource/HelloWorld2.txt"

  depends_on = [local_file.HelloWorld]
}

resource "local_file" "lifecycle" {
  content  = "lifecycle - step 5"
  filename = "${path.module}/resource/lifecycle.txt"

  lifecycle {
    # create_before_destroy 잘못된 예제
    # 파일 내용은 수정되지만, 최종적으로 삭제 시 동일한 파일을 삭제하여 파일이 삭제됨
    #create_before_destroy = true

    # 파일 내용을 수정하면, 테라폼 수명주기(삭제-생성)에 따라 수행되는 리소스에
    # prevent_destroy 속성이 적용되어 최종적으로 실패함
    #prevent_destroy = true

    # 파일 내용을 수정해도 실행 계획에 변경 사항이 포함되지 않아 변경이 발생하지 않음
    ignore_changes = [
      content
    ]
  }
}

# # precondition 속성 사용 예제
# resource "local_file" "lifecyclePrecondition" {
#   content  = "lifecycle - step 6"
#   filename = "${path.module}/resource/${var.file_name}"

#   lifecycle {
#     # 리소스 생성 이전에 입력된 인수 값을 검증
#     precondition {
#       condition     = var.file_name == "step6.txt"
#       error_message = "file_name is not \"step6.txt\""
#     }
#   }
# }

# # postcondition 속성 사용 예제
# resource "local_file" "lifecyclePostCondition" {
#   content  = ""
#   filename = "${path.module}/resource/step7.txt"

#   lifecycle {
#     # 리소스 생성 이후에 입력된 인수 값을 검증
#     # 의존성을 갖는 다른 구성의 변경을 막음
#     postcondition {
#       condition     = self.content != ""
#       error_message = "content cannot be empty"
#     }
#   }
# }

resource "local_file" "data1" {
  content  = "data"
  filename = "${path.module}/resource/data1.txt"
}

resource "local_file" "data2" {
  content  = data.local_file.file.content
  filename = "${path.module}/resource/data2.txt"
}

resource "local_file" "password" {
  content  = var.password
  filename = "${path.module}/resource/password.txt"
}

resource "local_file" "var" {
  content  = var.var
  filename = "${path.module}/resource/var.txt"
}

resource "local_file" "prefix" {
  content  = local.content
  filename = "${path.module}/resource/prefix.txt"
}
