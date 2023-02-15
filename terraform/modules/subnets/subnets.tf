resource "aws_subnet" "public" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = var.tags
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"

  tags = var.tags
}

resource "aws_nat_gateway" "private_internet_gateway" {
    connectivity_type = "private"
    subnet_id = aws_subnet.private.id

    tags = var.tags
}
