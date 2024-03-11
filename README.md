## Vehicle Tracking Microservices Application Deployment ( NEBIL , KATARZYNA )

***This project aims to deploy a microservices application for vehicle tracking in the AWS cloud. It leverages various technologies such as Kubernetes, Docker, Terraform, Jenkins, Prometheus, Alert Manager, horizontal scaling, readiness, and CI/CD with Helm.***


# Getting Started

## To get started with deploying the application, follow the steps below:

### Clone the repository:
- git clone git@github.com:katarzyna-da-silva/app_microservices.git
- cd app_microservices

### Pull the Docker image for the web application from Docker Hub:
- docker pull lnebilos/webapp:0.1

- Build the Docker image for the web application:
***docker build -t webapp:0.1 .***

### Create Kubernetes deployment:

````
kubectl create deployment webapp-deploy --image=lnebilos/webapp:0.1 --dry-run=client -o yaml > deployment.yaml

Create a ConfigMap for the application:

kubectl create configmap webapp-cm --dry-run=client -o yaml > webapp-configmap.yaml

Create a ClusterIP service for the application:

kubectl create service clusterip webapp-clusterip --tcp=30080:80 --dry-run=client -o yaml > webapp-service.yaml

Create a LoadBalancer service:

kubectl create service loadbalancer loadbalancer --tcp=80 --dry-run=client -o yaml > loadbalancer.yaml

````

### AWS 
Setting Up AWS Connection: 

1. FindAccess Key and Secret Key in AWS:

Log in to the AWS Management Console.
Navigate to the IAM (Identity and Access Management) service.
Select the user to be used for connecting to AWS or create a new user and assign appropriate permissions.
Go to the "Security credentials" tab for the selected user.
Generate or locate existing access keys (Access Key ID) and secret keys (Secret Access Key)

2. Configuring AWS Profile in Visual Studio Code:

Open the terminal in Visual Studio Code.
Use the aws configure --profile profile_name command and follow the instructions to provide the access key, secret key, region, and output format for the specified profile.

aws configure --profile my_profile

3. Verifying AWS Connection:

After configuring the AWS profile, run : 

aws sts get-caller-identity --profile my_profile

- Set up your AWS credentials by configuring the ~/.aws/credentials file or using environment variables.

***if necessary, add permissions for the ./.aws/credentials file: chmod a+x credentiales***


### Terraform Deployment

- To deploy the Kubernetes cluster using Terraform, follow these steps:

- Install Terraform on your local machine. You can download the appropriate version for your operating system from the Terraform website.

- Generate a token on the terraform website to connect it to your local environment or your vm.

- Create a directory for your Terraform files:


## CLUSTER CREATION BY TERRAFORM :


 The most important elements in the Terraform configuration files for running an EKS cluster are:

     EKS cluster configuration: In files such as sek-cluster.tf, you must define key cluster parameters such as name, version, network configuration, etc.

     Node configuration: In the sek-node-group-public.tf and sek-node-private.tf files, define groups of public and private nodes that will host our applications and microservices.

     VPC configuration: In the vpc.tf file, define the Virtual Private Cloud (VPC) and basic network parameters, such as public and private subnets.

     IAM roles: In the iam-role-for-eks-cluster.tf and iam-role-for-eks-nodegroup.tf files, you must define Identity and Access Management (IAM) roles for the EKS cluster and its node groups.

     Variables and local values: In the sek-variables.tf and local-values.tf files, you can define variables and local values that make it easier to tailor the configuration to your specific needs.

     Provider configuration: In the providers.tf file, you must define the providers, such as AWS, and the versions of the modules used.

     Outputs and variables: In the sek-outputs.tf and vpc-outputs.tf files, you can define outputs that are useful for storing information about created resources, and variables that facilitate configuration.


    1.  providers.tf: Terraform provider configuration.
    2.  eks-cluster.tf: The file contains the EKS (Amazon Elastic Kubernetes Service) cluster configuration.
    3.  iam-role-for-eks-cluster.tf: Configure IAM roles for the EKS cluster.
    4.  iam-role-for-eks-nodegroup.tf: Configure IAM roles for EKS cluster node groups.
    5.  eks-node-group-public.tf: Public node group configuration for the EKS cluster.
    6.  eks-node-private.tf: Private node group configuration for EKS cluster.
    7.  eks-outputs.tf: Output definitions for resources related to EKS clusters.

    8.  eks-variables.tf: Variables used in the EKS cluster configuration.

    
    9.  vpc.tf: VPC configuration.
    10. vpc-modules.tf: Configuration of VPC modules.
    11. vpc-outputs.tf: Output definitions for VPC-related resources.
    12. vpc-variables.tf: Variables used in VPC configuration.

    13. local-values.tf: Local values used in infrastructure configuration.
    14. generic-variables.tf: Generic variables used in infrastructure configuration.

````

# Initialize Terraform
terraform init

#TerraformValidate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create EC2 Instance
terraform apply

Destroy Infrastructure

# Destroy EC2 Instance
terraform destroy

# Delete Terraform files
rm -rf .terraform*
rm -rf terraform.tfstate*

````