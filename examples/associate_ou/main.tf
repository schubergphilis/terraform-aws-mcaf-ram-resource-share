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