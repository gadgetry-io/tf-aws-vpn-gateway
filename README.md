# tf-aws-vpn-gateway
Terraform AWS VPN Gateway Module

## Summary
This terraform module creates an AWS VPN Gateway and Connection to an existing AWS Customer Gateway.
- An AWS Customer Gateway must be provisioned separately.
- Learn More about [AWS VPN Connections](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html)

## Example Implementation

    /project                        # Terraform Project
        /workspaces                 # Workspaces
            /ops                    # Operations Environment
                vpn_gateway.<name>  # VPN Gateway Stack using Module
                    backend.tf
                    data.tf
                    main.tf
                    providers.tf
            /dev                    # Development Environment
            /tst                    # Testing Environment
            /stg                    # Staging Environment
            /prd                    # Production Environment

### backend.tf

    terraform {
        backend "s3" {
            bucket               = "<bucket_name>"
            key                  = "vpn_gateway_<name>"
            workspace_key_prefix = "terraform"
            region               = "us-east-1"
            profile              = "<profile_name>"
            role_arn             = "arn:aws:iam::<account_id>:role/<role_name>"

### data.tf

    data "terraform_remote_state" "network" {
        backend   = "s3"
        workspace = "${terraform.workspace}"

        config {
            bucket               = "<bucket_name>"
            key                  = "network"
            workspace_key_prefix = "terraform"
            region               = "us-east-1"
            profile              = "<profile_name>"
            role_arn             = "arn:aws:iam::<account_id>:role/<role_name>"
        }
    }

### main.tf

    module "vpn_gateway" {
        source                          = "git::ssh://git@github.com/gadgetry-io/tf-aws-vpn-gateway.git?ref=master"
        vgw_vpc_id                      = "<aws_vpc.id>"
        vgw_availability_zone           = "<e.g. us-east-1>"
        vgw_tag_name                    = "<e.g. vpn_gateway>"
        vgw_tag_environment             = "<e.g. operations>"
        vgw_tag_stack                   = "<e.g. vpn_gateway.office>"
        vpn_destination_cidr_block      = "<e.g. office private network cidr>"
        vpn_customer_gateway_id         = "<aws_customer_gateway.id>
    }

### providers.tf

    provider aws {
        region  = "us-east-1"
        profile = "<profile_name>"
    }