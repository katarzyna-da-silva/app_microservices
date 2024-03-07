terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
  }
 }
}

provider "aws" {
    profile = "default"
    region = "eu-west-3"
}

resource "aws_instance" "eck" {
    ami = ""
    instance_type = ""
}

resource "" "name" {
    provider = aws
}