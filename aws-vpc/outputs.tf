output "public-subnet" {
  value = aws_subnet.public-subnet[*].id
}

output "private-subnet" {
  value = aws_subnet.private-subnet[*].id
}