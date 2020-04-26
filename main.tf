provider "aws" {
  region = var.region
}

# Get the current region
data "aws_region" "current" {}

# Locals for Environment
locals {
  environment = jsonencode(var.environment_vars)
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "ecs" {
  name              = var.name
  retention_in_days = var.log_retention_in_days
}

### IAM
resource "aws_iam_role" "execution" {
  name               = "${var.name}-ecs-iam-role"
  assume_role_policy = file("${path.module}/policies/execution-role.json")
}

resource "aws_iam_role_policy" "execution" {
  name = "${var.name}-ecs-iam-role-policy"
  role = aws_iam_role.execution.name

  policy = file("${path.module}/policies/execution-role-policy.json")
}

resource "aws_iam_role" "task" {
  name               = "${var.name}-ecs-iam-task-role"
  assume_role_policy = file("${path.module}/policies/task-execution-role.json")
}

### Template for the Task Definition
data "template_file" "task_definition" {
  template = file("${path.module}/templates/task-definition.json")

  vars = {
    image_url         = var.image
    container_name    = var.name
    environment       = local.environment == "[]" ? "null" : local.environment
    ecs_cpu           = var.ecs_cpu
    ecs_mem           = var.ecs_mem
    log_group_region  = data.aws_region.current.name
    log_group_name    = aws_cloudwatch_log_group.ecs.name
    log_stream_prefix = var.name
    custom            = var.custom_container_definition == "" ? "" : var.custom_container_definition
  }
}

### ECS Task Definition
resource "aws_ecs_task_definition" "main" {
  family                   = var.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.task_definition.rendered
  execution_role_arn       = aws_iam_role.execution.arn
  task_role_arn            = aws_iam_role.task.arn
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_mem
}
