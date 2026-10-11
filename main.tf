data "aws_imagebuilder_distribution_configurations" "imagebuilder_distribution_configurations_lookup" {
  for_each = var.imagebuilder_distribution_configurations_lookup

  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

