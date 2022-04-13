output "instance_public_ip_0" {
  value = aws_instance.tf-ec2.*.public_ip
}

