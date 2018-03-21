resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = "${aws_vpn_gateway.main.id}"
  customer_gateway_id = "${var.vpn_customer_gateway_id}"
  type                = "ipsec.1"
  static_routes_only  = true
}