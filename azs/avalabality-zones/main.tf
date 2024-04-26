data "aws_availability_zones" "current" {
  state = "available"
  filter {
    name   = "region-name"
    values = [var.aws-region]
  }
}

data "aws_ami" "nat_instances" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat-2018.03.0.20220503.0-x86_64-ebs"] #mumbai["amzn-ami-vpc-nat-2018.03.0.20221018.0-x86_64-ebs"]
  }
}