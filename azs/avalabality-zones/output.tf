output "aws-azs" {
  value = data.aws_availability_zones.current.names
}

output "ami" {
  value = data.aws_ami.nat_instances.id
}