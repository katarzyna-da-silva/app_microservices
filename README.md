## Vehicle Tracking Microservices Application Deployment ( NEBIL , KATARZYNA )

***This project aims to deploy a microservices application for vehicle tracking in the AWS cloud. It leverages various technologies such as Kubernetes, Docker, Terraform, Jenkins, Prometheus, Alert Manager, horizontal scaling, readiness, and CI/CD with Helm.***

### Getting Started

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

### Terraform Deployment

- To deploy the Kubernetes cluster using Terraform, follow these steps:

- Install Terraform on your local machine. You can download the appropriate version for your operating system from the Terraform website.

- Generate a token on the terraform website to connect it to your local environment or your vm.

- Create a directory for your Terraform files:

````
mkdir terraform
cd terraform

Initialize Terraform in the directory:

terraform init

Validate your Terraform configuration:

terraform validate

Apply your Terraform configuration to create the Kubernetes cluster:

terraform apply

Destroy the Kubernetes cluster when you're done:

terraform destroy

````
## AWS 
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
