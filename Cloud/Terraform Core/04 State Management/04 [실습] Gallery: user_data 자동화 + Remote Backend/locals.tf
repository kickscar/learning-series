locals {
    org       = "tf-core"
    project   = "gallery"
    namespace = "${local.org}-${local.project}-${var.env}"

    selected_az = data.aws_availability_zones.available.names[var.az_num - 1]
}