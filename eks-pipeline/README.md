# EKS CI/CD Pipeline with Monitoring and Logging

This project provisions an EKS cluster using Terraform, sets up a CI/CD pipeline using GitHub Actions, and deploys Prometheus, Grafana, and Loki for monitoring and logging.

## Prerequisites

1. **AWS Account**: Ensure you have an AWS account with appropriate IAM permissions.
2. **Terraform**: Install Terraform on your local machine.
3. **GitHub Actions**: Setup GitHub repository to use GitHub Actions.
4. **AWS CLI**: Ensure AWS CLI is configured on your local machine.
5. **kubectl**: Install `kubectl` to interact with your Kubernetes cluster.
6. **Helm**: Install Helm for deploying Prometheus, Grafana, and Loki.

## Project Structure

- **terraform/**: Contains all the Terraform configurations.
- **.github/workflows/**: Contains the GitHub Actions workflow for CI/CD.
- **scripts/**: Contains shell scripts for deployment.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/eks-pipeline.git
cd eks-pipeline

2. Terraform Setup
Initialize Terraform and apply the configuration.

bash
Copy code
cd terraform
terraform init
terraform apply -auto-approve

3. Setup Kubernetes Config
Configure your kubectl to interact with the EKS cluster.

aws eks --region us-east-1 update-kubeconfig --name <cluster_name>

4. Deploy Monitoring and Logging Tools
Run the deployment script to install Prometheus, Grafana, and Loki.

bash scripts/deploy.sh

5. GitHub Actions CI/CD
The CI/CD pipeline is defined in .github/workflows/ci-cd.yml. On every push to the main branch, the pipeline will:

Initialize Terraform.
Plan and apply the infrastructure changes.
Deploy the application to EKS.

6. Accessing Grafana
Grafana is deployed with the default admin username admin and password admin123. You can access it via the LoadBalancer IP.

kubectl get svc --namespace monitoring grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

7. Accessing Prometheus and Loki
Prometheus and Loki can also be accessed via their respective LoadBalancer IPs.

kubectl get svc --namespace monitoring prometheus-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
kubectl get svc --namespace monitoring loki -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

Cleanup
To destroy the infrastructure and clean up resources:

cd terraform
terraform destroy -auto-approve

