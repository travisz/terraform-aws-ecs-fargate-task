# terraform-aws-ecs-fargate-task

This module creates an ECS Task Definition.

[![Actions Status](https://github.com/travisz/terraform-aws-ecs-fargate-task/workflows/GitHub%20Actions/badge.svg)](https://github.com/travisz/terraform-aws-ecs-fargate-task/actions)
![GitHub release](https://img.shields.io/github/release/travisz/terraform-aws-ecs-fargate-task.svg)
[![](https://img.shields.io/github/license/travisz/terraform-aws-ecs-fargate-task)](https://github.com/travisz/terraform-aws-ecs-fargate-task)
[![](https://img.shields.io/github/issues/travisz/terraform-aws-ecs-fargate-task)](https://github.com/travisz/terraform-aws-ecs-fargate-task)
[![](https://img.shields.io/github/issues-closed/travisz/terraform-aws-ecs-fargate-task)](https://github.com/travisz/terraform-aws-ecs-fargate-task)
[![](https://img.shields.io/github/languages/code-size/travisz/terraform-aws-ecs-fargate-task)](https://github.com/travisz/terraform-aws-ecs-fargate-task)
[![](https://img.shields.io/github/repo-size/travisz/terraform-aws-ecs-fargate-task)](https://github.com/travisz/terraform-aws-ecs-fargate-task)

## Basic Usage
Include the following in your configuration (customized as needed):

```hcl
module "ecs-task" {
  source  = "git::https://github.com/travisz/terraform-aws-ecs-fargate-task?ref=master"
  name    = "task-definition"
  image   = "hello-world"
  ecs_cpu = "256"
  ecs_mem = "1024"
}
```

If you need to define custom options in the Task Definition use the `custom_container_definition` variable (with json syntax). See below for an example:

```hcl
module "ecs-task" {
  source                      = "git::https://github.com/travisz/terraform-aws-ecs-fargate-task?ref=master"
  name                        = "task-definition"
  image                       = "hello-world"
  ecs_cpu                     = "256"
  ecs_mem                     = "1024"
  custom_container_definition = ",\n    \"startTimeout\": 90"
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| name | Name of the Task Definition | string | `` | yes |
| image | Name of the Docker Image | string | `` | yes |
| ecs_cpu | Amount of CPU for the ECS Task | number | `` | yes |
| ecs_mem | Amount of Memory for the ECS Task | number | `` | yes |
| log_retention_in_days | Number of days to retain CloudWatch Logs | number | `30` | no |
| custom_container_definition | Custom JSON to include with the Task Definition | string | `` | no |
