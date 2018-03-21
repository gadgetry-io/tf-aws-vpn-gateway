resource "local_file" "readme" {
  content  = "${data.template_file.readme.rendered}"
  filename = "${path.module}/README.${upper(terraform.workspace)}.md"
}

data "template_file" "readme" {
  template = <<EOF
# ${var.stack_name}
This stack provisions the ${upper(terraform.workspace)} ${upper(var.stack_name)} Stack.

## ${var.stack_name}

Key notes about this Stack:
- This stack creates an AWS VPN Gateway and Connection to an existing AWS Customer Gateway.
- An AWS Customer Gateway must be provisioned separately.

## LINKS
[AWS VPN Connections](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html)


### VPN GATEWAY CONFIGURATION

|ATTRIBUTE|VALUE|
|VPN Gateway ID|${aws_vpn_gateway.main.id}|
|VPN VPC ID|${var.vgw_vpc_id}|
|VPN Availability Zone|${var.vgw_availability_zone}|

### VPN CONNECTION CONFIGURATION

|ATTRIBUTE|VALUE|
|VPN Connection ID|${aws_vpn_connection.main.id}|
|Customer Gateway ID|${aws_vpn_connection.main.customer_gateway_id}|
|Static Routes Only|${aws_vpn_connection.main.static_routes_only}|

### VPN TUNNEL 1

|ATTRIBUTE|VALUE|
|Tunnel 1 Public IP|${aws_vpn_connection.main.tunnel1_address}|
|Tunnel 1 BGP ASN Number|${aws_vpn_connection.main.tunnel1_bgp_asn}|
|Tunnel 1 CGW Inside Address|${aws_vpn_connection.main.tunnel1_cgw_inside_address}|
|Tunnel 1 VGW Inside Address|${aws_vpn_connection.main.tunnel1_vgw_inside_address}|


### VPN TUNNEL 2

|ATTRIBUTE|VALUE|
|Tunnel 2 Public IP|${aws_vpn_connection.main.tunnel2_address}|
|Tunnel 2 BGP ASN Number|${aws_vpn_connection.main.tunnel2_bgp_asn}|
|Tunnel 2 CGW Inside Address|${aws_vpn_connection.main.tunnel2_cgw_inside_address}|
|Tunnel 2 VGW Inside Address|${aws_vpn_connection.main.tunnel2_vgw_inside_address}|

EOF
}
