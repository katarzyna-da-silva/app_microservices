resource "aws_eks_access_policy_association" "policy" {
  cluster_name  = aws_eks_cluster.policy.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
  principal_arn = aws_iam_user.example.arn

  access_scope {
    type       = "namespace"
    namespaces = ["example-namespace"]
  }
}