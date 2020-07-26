output "s3_access_role_name" {
    value    =    aws_iam_role.s3_access_role.name
}

output "s3_access_role_arn" {
    value    =    aws_iam_role.s3_access_role.arn
}

output "s3_access_instance_profile_name" {
    value    =    aws_iam_instance_profile.s3_access_instance_profile.name
}

output "s3_access_instance_profile_arn" {
    value    =    aws_iam_instance_profile.s3_access_instance_profile.arn
}
