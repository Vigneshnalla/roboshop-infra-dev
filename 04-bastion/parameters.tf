resource "aws_ssm_parameter" "bastion_public_ip" {
  name        = "/${var.project_name}/${var.environment}/bastion_public_ip"
  description = "Public IP of the Bastion instance"
  type        = "String"
  value       = module.bastion.public_ip
}