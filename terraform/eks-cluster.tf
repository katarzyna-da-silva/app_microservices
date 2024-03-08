resource "aws_eks_access_entry" "eks-iam-role" {     //ressource for aws- eks 
  cluster_name = cluster_eks.eks-iam-role.name    // name cluster 
  principal_arn = aws_iam_role.eks-iam-role.arn    // eks-iam-role, role arn for user = access for cluster 
  type = "STANDARD"  // 
}

