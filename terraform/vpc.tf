# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"                 #     cidr =   how to determine the range of IP addresses    Prefix Length (Subnet Mask): "/16" means that the first 16 bits of the IP address are fixed and the rest are variable.
  azs                 = ["eu-west-3a", "eu-west-3b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]


   # EKS Subnets
  #eks_create_subnet_group       = true
  #eks_create_subnet_route_table = true
  #eks_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
  #eks_create_nat_gateway_route  = true
  
  # NAT Gateways - Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }


  tags = {
    Owner = "katarzyna"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}

#### CIDR : 

#    Number of available IP addresses: Since we have 16 fixed bits and each octet of the IP address is 8 bits, we have 16 + 8 + 8 = 32 bits, which means we have 32 bits of IP address in total.
#    For "/16" we therefore have 32 - 16 = 16 variable bits. 
#    The number of available IP addresses is 2 to the power of 16, which gives us 65,536 different IP addresses that can be assigned to hosts on this network.

#### NAT AND GATEWAY 

#     NAT (Network Address Translation): 
#     NAT is a mechanism that translates the IP addresses and 
#     ports in network packets as they pass through a NAT device. 
#     It is used to allow multiple devices on a local private network to use one or more public IP addresses to 
#     communicate with resources on the Internet.


#     Gateway: a device that is used to connect various computer networks. 
#     Gateways can be used to route network traffic between different networks, 
#     control access to network resources, and enable communication between networks with different protocols 
#     or architectures.

### DNS : 

#     DNS (Domain Name System) for S3 and EKS allows you to identify and communicate with resources in these services using domain names instead of IP addresses. 
#     For S3, DNS allows you to access messages and other resources stored in S3 buckets through easy and readable URLs. 
#     For EKS, DNS is necessary for communication between EKS cluster nodes, 
#     container services, and other resources in the Kubernetes infrastructure using domain names.



# DNS (Domain Name System) contributes to the scalability of S3 and EKS services by providing a flexible way to identify resources using domain names. 
# Instead of relying on rigid IP addresses that may change as the infrastructure expands or in the event of a failure, 
# domain names allow abstraction from specific IP addresses. Thanks to this, the infrastructure can be easily developed or changed without the need to change 
# the configuration of applications or clients. Additionally, DNS enables the use of a flexible service-based architecture, 
# which makes it easier to manage resources and scale them based on needs and workload. 
# This ensures that as the infrastructure grows or changes, applications and services can continue to run smoothly and efficiently.