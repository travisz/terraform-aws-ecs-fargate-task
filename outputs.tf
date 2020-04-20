output "name" {
  value = var.name
}

output "image" {
  value = var.image
}

output "ecs_cpu" {
  value = var.ecs_cpu
}

output "ecs_mem" {
  value = var.ecs_mem
}

output "execution_role_arn" {
  value = aws_iam_role.execution.arn
}

output "execution_role_name" {
  value = aws_iam_role.execution.name
}

output "task_role_arn" {
  value = aws_iam_role.task.arn
}

output "task_role_role" {
  value = aws_iam_role.task.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.main.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.main.family
}

output "task_definition_revision" {
  value = aws_ecs_task_definition.main.revision
}
