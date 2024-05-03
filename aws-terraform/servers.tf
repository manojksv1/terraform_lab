# resource "aws_instance" "jump-server" {
#   count                  = 3
#   ami                    = data.aws_ami.ami.id
#   instance_type          = var.jump-server-instance_type
#   subnet_id              = module.vpc.public-subnet[0]
#   key_name               = var.key_name
#   vpc_security_group_ids = [aws_security_group.ssh-sg.id]
#   tags = {
#     Name = "jump-server ${count.index + 1}"
#   }
# }

# resource "aws_instance" "private-server" {
#   count                  = 3
#   ami                    = data.aws_ami.ami.id
#   instance_type          = var.jump-server-instance_type
#   subnet_id              = module.vpc.private-subnet[1]
#   key_name               = var.key_name
#   vpc_security_group_ids = [aws_security_group.ssh-sg.id]
#   tags = {
#     Name = "private-server ${count.index + 1}"
#   }
# }

resource "aws_security_group" "ssh-sg" {
  name        = "ssh-server-sg"
  description = "allow http and https traffic"
  vpc_id      = module.vpc.vpc

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ingress {
  #   description = "HTTP ingress"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description = "HTTPS ingress"
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
