resource "aws_eks_access_policy_association" "access_policy" {
  cluster_name  = cluster_eks.access_policy.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
  principal_arn = aws_iam_user.access_policy.arn

  access_scope {
    type       = "namespace"
    namespaces = ["policy_cluster"]
  }
}