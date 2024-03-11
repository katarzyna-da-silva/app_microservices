# EKS CLUSTER OUTPUTS

output "endpoint" {
  value = aws_eks_cluster.role.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.role.certificate_authority[0].data
}