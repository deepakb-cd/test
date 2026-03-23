resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

########################################
# Attach Managed Policies (GENERIC)
########################################

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

########################################
# Inline Policy (OPTIONAL)
########################################

resource "aws_iam_role_policy" "inline" {
  count = var.inline_policy_json != null ? 1 : 0

  name   = "${var.role_name}-inline-policy"
  role   = aws_iam_role.this.id
  policy = var.inline_policy_json
}