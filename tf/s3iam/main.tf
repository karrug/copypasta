provider "aws" {
  version = "~> 2.0"
  region = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_s3_bucket" "b" {
  bucket = "bucketname"
  acl = "private"

  tags = {
    Name = "tagname"
  }
}


resource "aws_iam_user" "user" {
  name = "bucketname"
  tags = {
    Name = "tagname"
  }
}


resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}


resource "aws_iam_user_policy" "policy" {
  name = "pttesttfpolicy"
  user = aws_iam_user.user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Resource": "arn:aws:s3:::bucketname"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::bucketname/*"
    }
  ]
}
EOF
}
