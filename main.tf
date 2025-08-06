resource "aws_ram_resource_share" "default" {
  name                      = var.name
  allow_external_principals = var.allow_external_principals
  permission_arns           = var.permission_arns
}

resource "aws_ram_resource_association" "default" {
  for_each = var.shared_resource_arns

  resource_arn       = each.value
  resource_share_arn = aws_ram_resource_share.default.arn
}

resource "aws_ram_principal_association" "default" {
  for_each = var.principals

  principal          = each.value
  resource_share_arn = aws_ram_resource_share.default.arn
}
