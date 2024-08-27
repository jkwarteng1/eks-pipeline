// terraform/eks/nodes.tf
module "eks_node_group" {
  source                 = "terraform-aws-modules/eks/aws//modules/node_groups"
  cluster_name           = module.eks.cluster_id
  cluster_security_group_id = aws_security_group.eks_cluster_sg.id
  subnets                = module.vpc.private_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_size
      min_capacity     = var.min_size

      instance_type = var.instance_type
      key_name      = "test-8-24.pem" // Replace with your EC2 key pair name
    }
  }
}

