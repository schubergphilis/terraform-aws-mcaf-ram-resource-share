module "ram_resource_share" {
  source  = "schubergphilis/mcaf-ram-resource-share/aws"
  version = "~> 1.0.0"

  name = "ram-resource-share"
  shared_resource_arns = {
    route53-profile-1 = "arn:aws:route53profiles:eu-central-1:123456789012:profile/rp-12345ab6c7de8fab"
  }
}