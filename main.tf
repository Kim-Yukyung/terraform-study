resource "local_file" "HelloWorld" {
  content  = "Hello, World!"
  filename = "${path.module}/HelloWorld.txt"
}
