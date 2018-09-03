module "vpc" {
  source = "../"

  # aws_region = "us-east-1"
  aws_region = "us-west-2"
  # aws_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  # aws_zones = ["us-east-1b"]
  # aws_zones = ["us-west-2a", "us-west-2c", "us-west-2c"]
  aws_zones = ["us-west-2a"]
  vpc_name = "spot-inst.k8s"
  vpc_cidr = "10.0.0.0/16"
  private_subnets = "false"

  ## Tags
  tags = {
    Name = "spot-inst.k8s"
    KubernetesCluster = "spot-inst.k8s"
    "kubernetes.io/cluster/spot-inst.k8s" = "owned"
  }

  subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
}





output "vpc" {
  value = "${module.vpc.vpc_id}"
}

output "subnets" {
  value = "${module.vpc.subnet_ids}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnet_ids}"
}