
output "alb_dns_name" {
  value = module.alb.alb_dns_name
  description = "URL to access the ECS service"
}
