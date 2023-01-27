resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    # nat_gateway_id = aws_nat_gateway.natnetwok.id
  }

  tags = {
    Name = "route table1"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route table2"
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public-subnet1[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_rt_asso" {
  subnet_id      = aws_subnet.public-subnet1[1].id
  route_table_id = aws_route_table.private.id
}