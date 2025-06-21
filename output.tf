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
