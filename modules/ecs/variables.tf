variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "container_definitions" {
  description = "The container definitions for the ECS task."
  type        = string
}

variable "project_name" {
  type = string
}

variable "container_name" {
  type = string
}
