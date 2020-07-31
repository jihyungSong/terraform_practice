resource "aws_s3_bucket" "bucket" {
    bucket              =   "${var.prefix}-${var.bucket}-aaaaa"
    acl                 =   "private"

    tags                = {
        Managed_by      =   "terraform"
    }
}

