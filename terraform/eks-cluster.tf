resource "aws_eks_access_entry" "eks-iam-role" {     //ressource for aws- eks 
  cluster_name = cluster_eks.name    // name cluster 
  principal_arn = aws_iam_role.eks-iam-role.arn    // eks-iam-role
  type = "STANDARD"
}