resource "aws_vpn_gateway" "main" {
  vpc_id = "${var.vgw_vpc_id}"
  availability_zone = "{var.vgw_availability_zone}"

  tags {
    Name         = "${var.vgw_tag_name}"
    Environment  = "${var.vgw_tag_environment}"
    Stack        = "${var.vgw_tag_stack}"
  }
}