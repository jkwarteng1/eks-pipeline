// scripts/deploy.sh
#!/bin/bash

# Apply the Terraform configurations
cd terraform
terraform init
terraform apply -auto-approve

# Configure kubectl
aws eks --region us-east-1 update-kubeconfig --name $(terraform output -raw cluster_name)

# Deploy Prometheus, Grafana, and Loki using Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus --namespace monitoring
helm install grafana grafana/grafana --namespace monitoring
helm install loki grafana/loki --namespace monitoring

