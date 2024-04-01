output "subnet_id" {
    value = aws_subnet.sample-subnet.id
}

output "sg_id" {
  value = aws_security_group.sample-sg.id
}