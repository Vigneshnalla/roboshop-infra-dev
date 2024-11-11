resource "aws_key_pair" "vpn" {
  key_name   = "vpn"
  public_key = file("~/.ssh/openvpn.pub")
}


module "vpn" {
  source   = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  ami       = data.aws_ami.ami_info.id
  name                   = "${local.ec2_name}-vpn"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id              = data.aws_subnet.selected.id
  tags = merge(
    var.common_tags,
    {
      Component = "vpn"
    },
    {
      Name = "${local.ec2_name}-vpn"
    }
  )
}