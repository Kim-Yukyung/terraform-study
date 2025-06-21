# 이미 생성된 로컬 파일 리소스를 참조하여 파일 경로를 얻음
data "local_file" "file" {
  filename = local_file.data1.filename  # local_file 리소스에서 생성한 파일 경로 사용
}
