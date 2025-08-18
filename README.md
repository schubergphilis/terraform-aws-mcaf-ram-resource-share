# terraform-aws-mcaf-ram-resource-share
Terraform module to create and associate an AWS RAM Resource Share

# Usage

To create an AWS RAM Resource share, define the following input variables:

1. `name` - This will be the name of the AWS RAM Resource Share
2. `shared_resource_arns` - This maps keys to resource ARNs that will be associated with the AWS RAM Resource Share

```hcl
module "ram_resource_share" {
  source  = "schubergphilis/mcaf-ram-resource-share/aws"
  version = "~> 1.0.0"

  name = "ram-resource-share"
  shared_resource_arns = {
   route53-profile-1 = "arn:aws:route53profiles:eu-central-1:123456789012:profile/rp-12345ab6c7de8fab"
  }
}
```

Optionally, you can associate the the AWS RAM Resource share to pricipals (like an AWS OU or an Account ID) like so:

```hcl
module "ram_resource_share" {
  source  = "schubergphilis/mcaf-ram-resource-share/aws"
  version = "~> 1.0.0"

  name = "ram-resource-share"
  shared_resource_arns = {
   route53-profile-1 = "arn:aws:route53profiles:eu-central-1:123456789012:profile/rp-12345ab6c7de8fab"
  }
  principals = {
    dev_ou     = "arn:aws:organizations::123456789014:ou/o-a100abfooo/ou-00a1-abc1d2e3",
    staging_ou = "arn:aws:organizations::123456789014:ou/o-a100abfooo/ou-00a1-abc1d2e4",
    prod_ou    = "arn:aws:organizations::123456789014:ou/o-a100abfooo/ou-00a1-abc1d2e5",
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.82 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.82 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ram_principal_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the AWS RAM Resource Share | `string` | n/a | yes |
| <a name="input_shared_resource_arns"></a> [shared\_resource\_arns](#input\_shared\_resource\_arns) | A map of keys to Resource ARNs to associate with the AWS RAM Resource Share | `map(string)` | n/a | yes |
| <a name="input_allow_external_principals"></a> [allow\_external\_principals](#input\_allow\_external\_principals) | Indicates whether principals outside your organization can be associated with the AWS RAM Resource Share | `bool` | `false` | no |
| <a name="input_permission_arns"></a> [permission\_arns](#input\_permission\_arns) | Specifies the Amazon Resource Names (ARNs) of the RAM permission to associate with the AWS RAM Resource Share. If you do not specify an ARN for the permission, AWS RAM automatically attaches the default version of the permission for each resource type. | `set(string)` | `null` | no |
| <a name="input_principals"></a> [principals](#input\_principals) | A map of keys to AWS Principals (Account ID's, OUs) to associate with the AWS RAM Resource Share | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_share_arn"></a> [resource\_share\_arn](#output\_resource\_share\_arn) | n/a |
| <a name="output_resource_share_id"></a> [resource\_share\_id](#output\_resource\_share\_id) | n/a |
| <a name="output_resource_share_name"></a> [resource\_share\_name](#output\_resource\_share\_name) | n/a |
<!-- END_TF_DOCS -->