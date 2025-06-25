# output "lifecyclePostCondition" {
#   value = local_file.lifecyclePostCondition.id
# }

output "list_index_0" {
  value = var.list[0]
}

output "list_all" {
  value = [
    for name in var.list :
    upper(name)
  ]
}

# 파일 절대 경로 출력
output "file_adspath" {
  value = abspath(local_file.prefix.filename)
}

# output "A_upper_value" {
#   value = [for v in var.names : upper(v)]
# }

# output "moved" {
#   value = local_file.moved_a.content
# }
