module "vpc" {
  source  = "./modules/vpc"
  project_name = "ecs-nginx-task"
}

// Create ECS + ALB