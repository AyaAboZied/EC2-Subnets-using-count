output "instance_ip_addr" {
  value = aws_instance.tf-ec2-public.public_ip
}
