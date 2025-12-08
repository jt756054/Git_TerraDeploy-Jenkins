resource "aws_vpc" "homely-vpc" {
  cidr_block       = var.cidr-block
  instance_tenancy = var.instance-tenancy

  tags = var.name-tag
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.homely-vpc.id

  count = length(var.availability-zone)
  cidr_block = var.public-subnet-cidr[count.index]
  availability_zone = var.availability-zone[count.index]

  tags = merge(
    var.name-tag,
    {
        Name = "homely-public-${count.index + 1}"
    }
  )
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.homely-vpc.id
  
  count = length(var.availability-zone)
  cidr_block = var.private-subnet-cidr[count.index]
  availability_zone = var.availability-zone[count.index]

  tags = merge(
    var.name-tag,
    {
        Name = "homely-private-${count.index + 1}"
    }
  )
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.homely-vpc.id

  tags = {
    Name = "homely-igw"
  }
}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.homely-vpc.id

  route {
    
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "homely-public-rt"
  }
}
resource "aws_route_table_association" "public-rt" {
    count = length(var.public-subnet-cidr)

  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_eip" "ngw" {
  domain   = "vpc"
}
resource "aws_nat_gateway" "private-subnet-ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public-subnet[0].id
  
  depends_on = [aws_internet_gateway.igw]
  
  tags = {
    Name = "private-subnet-ngw"
  }
}
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.homely-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private-subnet-ngw.id
  }

  tags = {
    Name = "homely-private-rt"
  }
}
resource "aws_route_table_association" "private-rt" {
    count = length(var.private-subnet-cidr)

  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private-rt.id
}