resource "aws_iam_instance_profile" "s3_access_instance_profile" {
  name = "${var.prefix}-${var.s3_access_role_name}"
  role = aws_iam_role.s3_access_role.name
}

resource "aws_iam_role" "s3_access_role" {
  name                =   "${var.prefix}-${var.s3_access_role_name}"
  assume_role_policy  =   file("${path.module}/assume_role_policy/${var.ec2_assume_role_file}")
}

resource "aws_iam_role_policy_attachment" "s3_AmazonS3FullAccess" {
  policy_arn          =   "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role                =   aws_iam_role.s3_access_role.name
}

