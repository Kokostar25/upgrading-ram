variable "principal" {
  description = "The principal to associate with the resource share. Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN."
  type        = string
  default     = "xxxxxxxxx"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}


variable "outpost-name" {
  type = string
  description = "Optionally Create resource"
  default = "AB"
}

variable "resource-share-names" {
  type = list(string)
  default = [
    "share-subnet-2",
    "subnet-share"
  ]

}

variable "resource-share-west" {
  type = list(string)
  default = [
    "subnet-west-resource-share",
    "subnet-west-resource-share-2"
  ]

}

variable "resource-share-member" {
  type = list(string)
  default = [
    "Shared-member-b",
    "shared-member-A"
  ]

}