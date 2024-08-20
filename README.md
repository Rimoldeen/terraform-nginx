## Requirements

- The solution must include at least 3 servers or containers in a cluster
- The solution should use a simple hello world application or this image [https://hub.docker.com/_/nginx] from Docker Hub
- The solution should be hosted in a VPC with two private subnets and two public subnets behind a load balancer listening on HTTP port 80
- The solution must be structured to use at least one Terraform module

----
## Overview 

This Terraform configuration sets up and deploys a containerised application using AWS ECS, ALB, and VPC. 
The configuration also includes AWS CloudWatch for logging.

- **VPC:** A custom VPC with public and private subnets.
- **ALB:** An Application Load Balancer to route traffic to the ECS service.
- **ECS:** An ECS service with Fargate tasks, configured to run an Nginx container.
- **CloudWatch Logs:** Centralised logging for the ECS tasks.

## Providers

| Name |
| ---- |
| AWS  |

## Modules

| Name       | Source                      | Version |
| ---------- | --------------------------- | ------- |
| module_alb | ./modules/terraform-aws-alb | n/a     |
| module_ecs | ./modules/terraform-aws-ecs | n/a     |
| module_vpc | ./modules/terraform-aws-vpc | n/a     |

## Outputs

| Name                | Description                   |
| ------------------- | ----------------------------- |
| output_alb_dns_name | URL to access the ECS service |
