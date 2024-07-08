output "instance_ip" {
  description = "ID of the EC2 instance"
  value       = [for instance in aws_instance.server : instance.public_ip]
}