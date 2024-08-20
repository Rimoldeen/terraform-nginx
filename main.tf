resource "aws_cloudwatch_log_group" "ecs_task_log_group" {
  name = "${var.project_name}-log-group"
}

data "aws_region" "current" {}

module "vpc" {
  source       = "./modules/terraform-aws-vpc"
  project_name = var.project_name
}

module "alb" {
  source         = "./modules/terraform-aws-alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  project_name   = var.project_name
}

# Deploy From an ECR Image Example - Basic Vite JS App 

# module "ecs" {
#   source           = "./modules/terraform-aws-ecs"
#   vpc_id           = module.vpc.vpc_id
#   private_subnets  = module.vpc.private_subnets
#   target_group_arn = module.alb.target_group_arn

#   project_name = "ecs-nginx-task"


#   // Basic nginx image
#   container_name = "frontend"
#   container_definitions = jsonencode([
#     {
#       name  = "frontend"
#       image = "113439214745.dkr.ecr.eu-west-2.amazonaws.com/frontend:latest"
#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ],

#       logConfiguration = {
#         logDriver = "awslogs"
#         options = {
#           awslogs-create-group  = "true"
#           awslogs-group         = aws_cloudwatch_log_group.ecs_task_log_group.name
#           awslogs-region        = data.aws_region.current.name
#           awslogs-stream-prefix = "ecs-nginx-task"
#         }
#       }
#     }
#   ])
# }

# Deploy From Docker Hub Image Example - Basic Nginx App
module "ecs" {
  source           = "./modules/terraform-aws-ecs"
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  target_group_arn = module.alb.target_group_arn

  project_name = var.project_name

  cpu            = "256"
  memory         = "512"
  desired_count  = 3
  container_name = "nginx"
  container_definitions = jsonencode([
    {
      name  = "nginx"
      image = "nginx:latest"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-create-group  = "true"
          awslogs-group         = aws_cloudwatch_log_group.ecs_task_log_group.name
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = var.project_name
        }
      }
    }
  ])
}
