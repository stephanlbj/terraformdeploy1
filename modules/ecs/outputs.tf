output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "ecs_service_name" {
  value = aws_ecs_service.this.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

output "ecs_task_image" {
  description = "Full container image used in ECS task definition"
  value       = length(aws_ecs_task_definition.this.container_definitions) > 0 ? jsondecode(aws_ecs_task_definition.this.container_definitions)[0].image : ""
}