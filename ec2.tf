# the public ec2 will be tf-ec2-public[0] and the private one will be tf-ec2-public[1]
resource "aws_instance" "tf-ec2-public" {
  count = 2
  ami           = var.ec2-var[0]
  instance_type = var.ec2-var[1]
  subnet_id     = aws_subnet.public-subnet1[count.index].id
  vpc_security_group_ids = [aws_security_group.sg.id]


  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF

  lifecycle {
    ignore_changes = [
      disable_api_termination,ebs_optimized,hibernation,security_groups,
      credit_specification,network_interface,ephemeral_block_device]
  }

}
