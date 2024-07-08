resource "aws_instance" "server" {
  for_each = var.instances

  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  availability_zone           = each.value.availability_zone
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  subnet_id                   = aws_subnet.subnet["public_subnet"].id
  associate_public_ip_address = true

  tags = {
    Name = each.value.name
  }
}
