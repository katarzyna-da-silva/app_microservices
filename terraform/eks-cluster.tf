# CREATE AWS CLUSTER EKS 
# ENABLE EKS CLUSTER CONTROL PLANE LOGGING
# PERMISSION IAM ROLE , CREATED AND DELETED AFTER EKS 
resource "aws_eks_access_entry" "eks-iam-role" {   #ressource for aws- eks 
  cluster_name = cluster_eks.eks-iam-role.name       #name cluster 
  principal_arn = aws_iam_role.eks-iam-role.arn   #eks-iam-role, role arn for user = access for cluster 
}

resource "aws_eks_cluster" "role" {
  name     = "role"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.role-AmazonEKSVPCResourceController,
  ]
}