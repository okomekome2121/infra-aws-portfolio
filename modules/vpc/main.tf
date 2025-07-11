resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "${var.name_prefix}-public-rt"
  }
}

# Public Subnet 1
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
} 

# Public Subnet 2
resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidrs[0]
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidrs[1]
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route.id
}

