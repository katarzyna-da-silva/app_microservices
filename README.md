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


## cluster creation:

1. connection to the provider:
- setting region, source and version

2. connecting to the Gatawey API: (application isolation and security)
for a public subnet that will download and use data, from a private subnet that will not disclose it to the outside world

public :
- for external connections, for other resources (services) in AWS, e.g. load balancer or EC2, which must be in the external world

private: a database in AWS that must be protected from the Internet and the exes we want to create


- EKS is subnet private and thanks to getaway it is partially public because k8s points (so-called api server) enable interaction with Kubernetes clusters. These endpoints are the main entrances to the cluster where queries and requests are made to manage and perform operations on the cluster's resources.


3. creating a vpc file for the subnet, isolating the network, controlling resource availability, creating security rules, configuring the routing table for traffic control

-   EKS-cluster.tf: This file contains the EKS cluster configuration such as the definition of the cluster itself, including the Kubernetes version, configuration parameters such as cluster name, region, EKS version, etc.

-   EKS-node-private.tf: This file contains the configuration of the private group of worker nodes of the EKS cluster, i.e. a group of EC2 instances that will work as cluster nodes in private subnets.

-   EKS-variables.tf: This file contains Terraform variables that are used in other files to parameterize the EKS cluster configuration.

-   iam-role-for-eks-cluster.tf: This file contains the Identity and Access Management (IAM) role configuration for the EKS cluster, which grants permissions to the cluster to perform various activities in AWS.

-   policy.tf: This file contains the IAM policy definitions that are used to configure IAM roles for the EKS cluster.

-   role-cluster.tf: This file contains the IAM role configuration for the EKS cluster.

-   terraform.tfvars: This file contains the values of Terraform variables that are used in the EKS cluster configuration. It may contain, for example, values for access keys, secret keys, cluster name, etc.

-   EKS.auto.tfvars: This file contains settings automatically generated by Terraform that are used to configure the EKS cluster.

-   EKS-node-group-public.tf: This file contains the configuration of the public group of worker nodes of the EKS cluster, i.e. a group of EC2 instances that will work as cluster nodes in public subnets.

-   EKS-outputs.tf: This file contains output definitions that can be used to export values from an EKS cluster configuration to other Terraform modules or to other applications.

-   subnet-node-group.tf: This file contains the configuration of subnets that will be used by the worker node groups of the EKS cluster.

-   vpc.auto.tfvars: This file contains settings automatically generated by Terraform that are used to configure the VPC (Virtual Private Cloud) for the EKS cluster.

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