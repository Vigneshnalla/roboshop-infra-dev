resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"                  # Replace this with your desired key name
  public_key = file("C:/Users/Vignesh/.ssh/bastion.pub")  # Path to your public key file
}

module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  # convert StringList to list and get first element
  subnet_id = local.public_subnet_id
  ami = data.aws_ami.ami_info.id
  user_data = file("bastion.sh")
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}

# resource "null_resource" "bastion_provision" {
#   depends_on = [aws_instance.bastion]

#   provisioner "file" {
#     source      = "bastion.sh"
#     destination = "/tmp/bastion.sh"

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("C:/Users/Vignesh/.ssh/bastion")  # Private key path
#       host        = aws_instance.bastion.public_ip
#     }
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/bastion.sh",
#       "/tmp/bastion.sh"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("C:/Users/Vignesh/.ssh/bastion")  # Private key path
#       host        = aws_instance.bastion.public_ip
#     }
#   }
# }

