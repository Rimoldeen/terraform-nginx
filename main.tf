module "vpc" {
  source       = "./modules/terraform-aws-vpc"
  project_name = "ecs-nginx-task"
}

module "alb" {
  source         = "./modules/terraform-aws-alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  project_name   = "ecs-nginx-task"
}

module "ecs" {
  source           = "./modules/terraform-aws-ecs"
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  target_group_arn = module.alb.target_group_arn

  project_name = "ecs-nginx-task"


  // Basic nginx image
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
      ]
    }
  ])
}