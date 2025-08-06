# terraform-aws-mcaf-ram-resource-share
Terraform module to create and associate an AWS RAM Resource Share

# Usage

To create an AWS RAM Resource share, define the following input variables:

1. `name` - This will be the name of the AWS RAM Resource Share
2. `shared_resource_arns` - This maps keys to resource ARNs that will be associated with the AWS RAM Resource Share

```hcl
module "ram_resource_share" {
  source = "../../"

  name = "ram-resource-share"
  shared_resource_arns = {
   route53-profile-1 = "arn:aws:route53profiles:eu-central-1:123456789012:profile/rp-12345ab6c7de8fab"
  }
}
```

Optionally, you can associate the the AWS RAM Resource share to pricipals (like an AWS OU or an Account ID) like so:

```hcl
module "ram_resource_share" {
  source = "../../"

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
