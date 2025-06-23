# 이미 생성된 로컬 파일 리소스를 참조하여 파일 경로를 얻음
data "local_file" "file" {
  filename = local_file.data1.filename # local_file 리소스에서 생성한 파일 경로 사용
}

data "archive_file" "dotfiles" {
  type        = "zip"
  output_path = "${path.module}/resource/dotfiles.zip"

  dynamic "source" {
    for_each = var.file_content
    content {
      content  = source.value
      filename = "${path.module}/${source.key}.txt"
    }
  }
}
