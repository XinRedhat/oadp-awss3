variable "bucket" {
    type = string
    description = "AWS S3 bucket name"
}

variable "region" {
    type = string
    description = "AWS region where the resource group will be created"
    default = "us-east-2"
}
