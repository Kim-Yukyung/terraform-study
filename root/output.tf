output "pw1" {
  value = module.mypw1
}

output "pw2" {
  value = module.mypw2
}

output "module_output_california" {
  value = module.ec2_california.private_ip
}

output "module_output_seoul" {
  value = module.ec2_seoul.private_ip
}
