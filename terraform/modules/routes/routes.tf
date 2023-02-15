resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = var.tags
}

resource "aws_route_table_association" "public" {
    count = length(var.public_subnets)

    subnet_id = var.public_subnets[count.index]
    route_table_id = aws_route_table.main.id
}
