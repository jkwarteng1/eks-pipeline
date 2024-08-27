// terraform/main.tf

module "vpc" {
  source  = "./eks/vpc.tf"
}

module "eks" {
  source  = "./eks/cluster.tf"
}

module "eks_security_groups" {
  source  = "./eks/security_groups.tf"
}

module "eks_nodes" {
  source  = "./eks/nodes.tf"
}

module "prometheus" {
  source = "./monitoring/prometheus.tf"
}

module "grafana" {
  source = "./monitoring/grafana.tf"
}

module "loki" {
  source = "./monitoring/loki.tf"
}

