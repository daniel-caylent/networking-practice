output "public" {
    value = aws_subnet.public
}

output "private" {
    value = aws_subnet.private
}

output "public_ids" {
    value = [aws_subnet.public.id]
}

output "private_ids" {
    value = [aws_subnet.private.id]
}

