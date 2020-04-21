variable "region" {
  description = "AWS Region to create the Task Definition in"
  type        = string
}

variable "name" {
  description = "Name of the ECS Task"
  type        = string
}

variable "image" {
  description = "Name of the Docker Image"
  type        = string
}

variable "ecs_cpu" {
  description = "Amount of CPU for the container"
  type        = number
}

variable "ecs_mem" {
  description = "Amount of Memory for the container"
  type        = number
}

variable "log_retention_in_days" {
  default     = 30
  description = "Number of days to retain ECS log in CloudWatch"
  type        = number
}

variable "custom_container_definition" {
  default     = ""
  description = "Custom configuration for the container definition"
  type        = string
}
