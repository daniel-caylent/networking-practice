resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = var.tags
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main.id

    tags = var.tags
}
