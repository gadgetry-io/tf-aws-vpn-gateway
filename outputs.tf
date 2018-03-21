###############################################################################
# VPN Gateway Outputs

output "vgw_id" {
  value = "${aws_vpn_gateway.main.id}"
}

###############################################################################
# VPN Connection Outputs.

output "vpn_id" {
  value = "${aws_vpn_connection.main.id}"
}

output "vpn_type" {
  value = "${aws_vpn_connection.main.type}"
}

output "vpn_customer_gateway_id" {
  value = "${aws_vpn_connection.main.customer_gateway_id}"
}

output "vpn_static_routes_only" {
  value = "${aws_vpn_connection.main.static_routes_only}"
}

output "vpn_tunnel1_address" {
  value = "${aws_vpn_connection.main.tunnel1_address}"
}

output "vpn_tunnel1_bgp_asn" {
  value = "${aws_vpn_connection.main.tunnel1_bgp_asn}"
}

output "vpn_tunnel1_cgw_inside_address" {
  value = "${aws_vpn_connection.main.tunnel1_cgw_inside_address}"
}

output "vpn_tunnel1_vgw_inside_address" {
  value = "${aws_vpn_connection.main.tunnel1_vgw_inside_address}"
}

output "vpn_tunnel2_address" {
  value = "${aws_vpn_connection.main.tunnel2_address}"
}

output "vpn_tunnel2_bgp_asn" {
  value = "${aws_vpn_connection.main.tunnel2_bgp_asn}"
}

output "vpn_tunnel2_cgw_inside_address" {
  value = "${aws_vpn_connection.main.tunnel2_cgw_inside_address}"
}

output "vpn_tunnel2_vgw_inside_address" {
  value = "${aws_vpn_connection.main.tunnel2_vgw_inside_address}"
}