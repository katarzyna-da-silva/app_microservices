# CREATE AWS EKS NODE GROUP - PRIVATE
# IAM PERMISSIONS, CRTEATED BEFORE AND DELETED AFTER EKS 

# CREATE AWS EKS NODE GROUP - PUBLIC
# IAM PERMISSIONS, CRTEATED BEFORE AND DELETED AFTER EKS 

resource "aws_eks_node_group" "eks_ng_private" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  
  node_group_name = "${local.name}-eks-ng-private"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
  version         = var.cluster_version

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
    # max_unavailable_percentage = 50
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks--AmazonEC2ContainerRegistryReadOnly,
  ]

tags = {
  Name = "Private-Node-Group"
}
}