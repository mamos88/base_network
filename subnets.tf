resource "aws_subnet" "base_network-lab-pub" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.base_network-lab-vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}${var.az_map[count.index]}"

  tags = {
    Name      = "base_network-lab"
    Terraform = "true"
  }
}