resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids = [aws_subnet.cluster.id, aws_subnet.cluster2.id]
  }

# cluster EKS dépend de l'inclusion de stratégies IAM. 
# Terraform attendra le chargement de ces pièces jointes avant de créer le cluster EKS.
depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,                       // gestion cluster eks
    aws_iam_role_policy_attachment.cluster-AmazonEKSVPCResourceController,              //Ressource vpc 
    ]
}

## Les sous-réseaux d'Amazon EKS sont utilisés pour organiser les ressources du cluster 
## Kubernetes dans le cloud AWS, assurant l'isolation et la gestion de l'accès aux ressources 
## en réseau telles que les instances EC2 et les ressources de conteneur. Ils permettent également 
## la séparation et la gestion du trafic réseau, permettant le fonctionnement efficace du cluster EKS dans 
## une zone réseau sélectionnée dans le VPC.


