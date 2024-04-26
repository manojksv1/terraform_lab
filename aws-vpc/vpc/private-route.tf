resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_instance.nat_server.primary_network_interface_id

  }
  tags = {
    Name  = "Private-route"
    from  = "trrafrom"
    owner = "manoj"
  }
}

resource "aws_route_table_association" "association_private" {
  route_table_id = aws_route_table.private-route-table.id
  count          = length(var.private-cidr)
  subnet_id      = aws_subnet.private-subnet[count.index].id
}