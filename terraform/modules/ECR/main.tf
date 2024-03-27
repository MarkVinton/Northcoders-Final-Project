# Creating an ECR Repositories

resource "aws_ecr_repository" "frontend_ecr" {
  name                 = "team-ecr-repository-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "backend_ecr" {
  name                 = "team-ecr-repository-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Pushing Docker Images

resource "null_resource" "push_docker_images" {
  depends_on = [
    aws_ecr_repository.frontend_ecr,
    aws_ecr_repository.backend_ecr
  ]

  provisioner "local-exec" {
    command = <<EOF
    # Login to ECR
    aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.frontend_ecr.repository_url}
    aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.backend_ecr.repository_url}

    # frontend image
    docker pull markvinton/frontend:1.0.0
    docker tag markvinton/frontend:1.0.0 ${aws_ecr_repository.frontend_ecr.repository_url}:frontend-1.0.0
    docker push ${aws_ecr_repository.frontend_ecr.repository_url}:frontend-1.0.0

    # backend image
    docker pull markvinton/backend:1.0.0
    docker tag markvinton/backend:1.0.0 ${aws_ecr_repository.backend_ecr.repository_url}:backend-1.0.0
    docker push ${aws_ecr_repository.backend_ecr.repository_url}:backend-1.0.0
EOF
  }
}

