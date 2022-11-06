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
  count              = var.outpost-name == "AB" && var.aws_region == "us-east-1" ? length(var.resource-share-names) : 0
  resource_share_arn = data.aws_ram_resource_share.subnet-shared[count.index].arn
  principal          = var.principal
  
}

resource "aws_ram_principal_association" "that" {
  provider           = aws.usw2
  count              = var.outpost-name == "BC" && var.aws_region  == "us-west-2" ? length(var.resource-share-west) : 0
  principal          = var.principal
  resource_share_arn = data.aws_ram_resource_share.subnet-shared-2[count.index].arn
}

resource "aws_ram_principal_association" "orthis" {
  provider           = aws.use2
  count              = var.outpost-name == "DDC" && var.aws_region  == "us-east-1" ? length(var.resource-share-member) : 0
  principal          = var.principal
  resource_share_arn = data.aws_ram_resource_share.subnet-shared-3[count.index].arn
}

