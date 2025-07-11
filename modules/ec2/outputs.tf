output "instance_id" {
  value = aws_instance.dev-test.id
}

output "public_ip" {
  value = aws_instance.dev-test.public_ip
}
