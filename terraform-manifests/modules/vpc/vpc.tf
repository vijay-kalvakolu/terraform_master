# Resource - VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = merge (var.tags, {Name = "${var.env_name}-vpc"})
}

# Resource - Public Subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = each.value
availability_zone = each.key
    map_public_ip_on_launch = true
    tags = merge (var.tags, {Name = "${var.env_name}-public-subnet"})   
}
