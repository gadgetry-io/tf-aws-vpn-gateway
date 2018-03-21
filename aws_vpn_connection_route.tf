resource "aws_vpn_connection_route" "main" {
  destination_cidr_block = "${var.vpn_destination_cidr_block}"
  vpn_connection_id      = "${aws_vpn_connection.main.id}"
}