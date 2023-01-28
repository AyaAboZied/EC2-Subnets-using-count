# get the public ip of the public ec2 to see if apache install without going to console
output "instance_ip_addr" {
  value = aws_instance.tf-ec2-public[0].public_ip
}
