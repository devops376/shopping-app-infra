data "aws_ami" "latest" {
  most_recent = true
  owners = ["self"]

  filter {
    name = "name"
    values = [ "${var.project_name}-${var.project_env}-*" ]
  }

  filter {
    name = "tag:project"
    values = ["${var.project_name}"]
  }

  filter {
    name = "tag:env"
    values = ["${var.project_env}"]
  }

}

data "aws_route53_zone" "get_data_hosted_zone_name" {

  name         = var.hosted_zone_name
  private_zone = false

}
