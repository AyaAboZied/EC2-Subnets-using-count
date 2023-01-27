
resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_nat_gateway" "natnetwok" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public-subnet1[0].id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}