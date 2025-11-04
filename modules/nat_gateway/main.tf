resource "aws_eip" "nat_eip_az1" {
  tags = {
    Name = "${var.project_name}-nat-eip-az1"
  }
}

resource "aws_eip" "nat_eip_az2" {
  tags = {
    Name = "${var.project_name}-nat-eip-az2"
  }
}

resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.nat_eip_az1.id
  subnet_id     = var.public_subnet_az1_id

  tags = {
    Name = "${var.project_name}-nat-gateway-az1"
  }

  depends_on = [var.internet_gateway_id]
}

resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.nat_eip_az2.id
  subnet_id     = var.public_subnet_az2_id

  tags = {
    Name = "${var.project_name}-nat-gateway-az2"
  }

  depends_on = [var.internet_gateway_id]
}

resource "aws_route_table" "private_route_table_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "${var.project_name}-private-rt-az1"
  }
}

resource "aws_route_table" "private_route_table_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "${var.project_name}-private-rt-az2"
  }
}

resource "aws_route_table_association" "private_app_subnet_az1_association" {
  subnet_id      = var.private_app_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}

resource "aws_route_table_association" "private_app_subnet_az2_association" {
  subnet_id      = var.private_app_subnet_az2_id
  route_table_id = aws_route_table.private_route_table_az2.id
}

resource "aws_route_table_association" "private_data_subnet_az1_association" {
  subnet_id      = var.private_data_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}

resource "aws_route_table_association" "private_data_subnet_az2_association" {
  subnet_id      = var.private_data_subnet_az2_id
  route_table_id = aws_route_table.private_route_table_az2.id
}
