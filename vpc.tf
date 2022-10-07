# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc
  enable_dns_hostnames = true
}

resource "aws_subnet" "zonea" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subneta
  availability_zone       = var.zonea

}

resource "aws_subnet" "zoneb" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnetb
  availability_zone       = var.zoneb

}

resource "aws_internet_gateway_attachment" "gway" {
  internet_gateway_id = aws_internet_gateway.gw.id
  vpc_id              = aws_vpc.main.id
}

resource "aws_internet_gateway" "gw" {}

