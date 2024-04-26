resource "aws_subnet" "public-subnet" {
  count                   = length(var.public-cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-cidr[count.index]
  availability_zone       = var.availability_zone_list[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name  = "Public-Subnet-${count.index + 1}"
    from  = "trrafrom"
    owner = "manoj"
  }
}

resource "aws_subnet" "private-subnet" {
  count             = length(var.public-cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-cidr[count.index]
  availability_zone = var.availability_zone_list[count.index]
  tags = {
    Name  = "Private-Subnet-${count.index + 1}"
    from  = "trrafrom"
    owner = "manoj"
  }
}