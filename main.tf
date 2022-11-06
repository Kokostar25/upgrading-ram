terraform {
      required_providers {
         aws = {
         source = "hashicorp/aws"
        //  version = "= 3.74.2"
         version =  "~> 4.26"

        }
     }
  }



provider "aws" {
//   alias  = "adminmember"
  region  = "us-east-1"
  profile = "adminmember"

}

provider "aws" {
  alias = "use1"
  region  = "us-east-1"
  profile = "adminmaster"

}

provider "aws" {
  alias = "usw2"
  region  = "us-west-2"
  profile = "adminmaster"

}

provider "aws" {
  alias = "use2"
  region  = "us-east-1"
  profile = "adminmistress"

}

resource "aws_ram_principal_association" "this" {
  provider           = aws.use1
  count              = length(var.resource-share-names)
  principal          = var.principal
  resource_share_arn = data.aws_ram_resource_share.subnet-shared[count.index].arn
}

resource "aws_ram_principal_association" "that" {
  provider           = aws.usw2
  count              = length(var.resource-share-west)
  principal          = var.principal
  resource_share_arn = data.aws_ram_resource_share.subnet-shared-2[count.index].arn
}

resource "aws_ram_principal_association" "orthis" {
  provider           = aws.use2
  count              = length(var.resource-share-west)
  principal          = var.principal
  resource_share_arn = data.aws_ram_resource_share.subnet-shared-3[count.index].arn
}