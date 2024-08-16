## Requirements

- The solution must include at least 3 servers or containers in a cluster
- The solution should use a simple hello world application or this image [https://hub.docker.com/_/nginx] from Docker Hub
- The solution should be hosted in a VPC with two private subnets and two public subnets behind a load balancer listening on HTTP port 80
- The solution must be structured to use at least one Terraform module

### What this Repo deploys

- ECS - Fargate (3 Instances)
- VPC - 2 Private Subnets / 2 Public Subnets
  - IGW
  - NAT GW
- ALB

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
