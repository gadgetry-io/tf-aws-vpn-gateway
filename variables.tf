# STACK VARIABLES
variable stack_name {
  type = "string"
  default = "vpn_gateway"
}

# VPN GATEWAY VARIABLES (vgw)
variable vgw_vpc_id {
  type = "string"
}

variable vgw_availability_zone {
  type = "string"
}

variable vgw_tag_name {
  type = "string"
}

variable vgw_tag_environment {
  type = "string"
}

variable vgw_tag_stack {
  type = "string"
  default = "vpn_gateway"
}

# VPN CONNECTION VARIABLES (vpn)
variable vpn_destination_cidr_block {
  type = "string"
}

variable vpn_customer_gateway_id {
  type = "string"
}


