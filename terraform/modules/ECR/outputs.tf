output "frontend_ecr_repository_url" {
  value = "${aws_ecr_repository.frontend_ecr.repository_url}"
}

output "backend_ecr_repository_url" {
  value = "${aws_ecr_repository.backend_ecr.repository_url}"
}
