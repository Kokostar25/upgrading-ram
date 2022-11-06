data "aws_ram_resource_share" "subnet-shared" {
  provider           = aws.use1
  count          = length(var.resource-share-names)
  name           = var.resource-share-names[count.index]
  resource_owner = "SELF"
}

data "aws_ram_resource_share" "subnet-shared-2" {
  provider       = aws.usw2
  count          = length(var.resource-share-west)
  name           = var.resource-share-west[count.index]
  resource_owner = "SELF"
}
data "aws_ram_resource_share" "subnet-shared-3" {
  provider       = aws.use2
  count          = length(var.resource-share-member)
  name           = var.resource-share-member[count.index]
  resource_owner = "SELF"
}