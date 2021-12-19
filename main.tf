provider "aws" {
  region = var.region
}

locals {
  velero_user = "${var.bucket}-user"
  velero_policy = "${var.bucket}-policy"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl = "private"
  force_destroy = true
}

resource "aws_iam_user" "velero" {
  name = local.velero_user
}

data "template_file" "policy_file" {
  template = file("templates/policy.json.tpl")
  vars = {
    bucket_name = var.bucket
  }
}

resource "aws_iam_user_policy" "velero" {
  name = local.velero_policy
  user = aws_iam_user.velero.name
  policy = data.template_file.policy_file.rendered
}

resource "aws_iam_access_key" "velero" {
  user = aws_iam_user.velero.name
}

resource "local_file" "credentials-velero" {
    content     = templatefile("templates/credentials-velero.tpl", 
      {
        AWS_ACCESS_KEY_ID = aws_iam_access_key.velero.id
        AWS_SECRET_ACCESS_KEY = aws_iam_access_key.velero.secret
      }
    )
    filename = "credentials-velero"
}
