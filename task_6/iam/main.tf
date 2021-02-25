provider "aws" {
  region = var.region
  profile = var.profile
}

# it can be dynamic, just to show I know locals
locals {
  prefix_name = "kraken-task-6"
}

data "template_file" "policy" {
  template = file("${path.module}/polcies/empty.json.tmpl")
}

module "empty_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 3.0"

  name        = "${local.prefix_name}-policy"
  description = "Emty policy"

  policy = data.template_file.policy.rendered
}

module "iam_assumable_role_custom" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::${var.account_id}:user/${var.allowed_user}",
  ]

  create_role = true

  role_name         = "${local.prefix_name}-role"
  role_requires_mfa = false

  custom_role_policy_arns = [
    module.empty_iam_policy.arn
  ]
}

module "iam_group_with_custom_policies" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  name = "${local.prefix_name}-group"

  custom_group_policy_arns = [
    module.empty_iam_policy.arn
  ]
}
