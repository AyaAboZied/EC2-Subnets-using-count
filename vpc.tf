resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cider
  instance_tenancy = "default"

  tags = {
    Name = "vpc-devops1"
  }
}

resource "aws_subnet" "public-subnet1" {
  count = 2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subn-cider[count.index]
  # count == 2 ? map_public_ip_on_launch = "false":map_public_ip_on_launch = "true"
   map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet ${count.index}"
  }
}

# resource "aws_subnet" "private-subnet1" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.priv-subn-cider
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "private-subnet1"
#   }
# }



