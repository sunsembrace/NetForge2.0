
NetForge 2.0 — Project Overview & Architecture
🧾 What Is NetForge 2.0?
NetForge 2.0 is a production-ready AWS infrastructure project built entirely with Terraform. It creates a secure, scalable, and maintainable cloud environment for internal business applications. This includes backend services and relational databases.

It replaces legacy manual setups like bastion hosts with modern best practices including:

SSM (AWS Systems Manager) for secure remote access (no SSH or public IPs)

Private subnets for sensitive workloads

IAM roles and VPC endpoints for security

Infrastructure as code (IaC) with reusable, modular Terraform

💼 Business Problem Solved
Modern businesses need:

Secure hosting for sensitive workloads (databases, app servers) isolated from the public internet

Secure, auditable remote access without exposing ports or SSH

Scalability, high availability, and cost control

Repeatable, version-controlled infrastructure deployments

NetForge 2.0 solves these by:

Deploying private EC2 and RDS instances inside isolated subnets

Using AWS SSM for remote management, eliminating bastion hosts and SSH exposure

Automating infrastructure via modular Terraform

Adding logging, secrets management, and budgets to align with enterprise production needs

🧱 Architecture Components (Main Blocks)
1. Networking
Custom VPC (CIDR: 10.0.0.0/16)

2 Public Subnets (for NAT Gateway and other public resources)

2 Private Subnets (one per availability zone for EC2 and RDS)

Internet Gateway attached to VPC for public outbound traffic

NAT Gateway deployed in public subnets to provide private subnet outbound internet access

Route Tables configured for public/private routing

2. Security & Access
IAM Roles:

For EC2 instances to communicate securely with SSM and other AWS services

For Terraform to access resources securely

Security Groups:

Allow EC2 → RDS communication on PostgreSQL port 5432

Deny all inbound public traffic to EC2 and RDS instances

SSM Parameter Store for storing secrets (like database passwords) securely, encrypted

3. Infrastructure Services
VPC Endpoints for SSM (SSM, EC2Messages, SSMMessages) — so EC2 instances can use SSM without public internet access

Terraform Remote Backend using S3 bucket and DynamoDB table for state locking and versioning

Tagging applied consistently to all resources (Environment, Project, Owner)

4. Compute & Database
EC2 Instance deployed in private subnet — no public IP, accessed only via SSM Session Manager

RDS PostgreSQL database deployed multi-AZ in private subnets, no public access, secured by SG rules

5. Monitoring & Cost Controls
CloudWatch Alarms to monitor resource health (e.g., RDS CPU > 70%)

AWS Budgets configured with email alerts to control costs

VPC Flow Logs optionally enabled for auditing network traffic

🔁 Workflow / How It Works Step-by-Step
Terraform provisions:

VPC with public and private subnets

Internet Gateway & NAT Gateway for routing

EC2 instance in private subnet

RDS PostgreSQL in private subnet (multi-AZ)

IAM Roles and Security Groups

VPC Endpoints for SSM

Terraform remote backend resources (S3 + DynamoDB)

CloudWatch alarms and AWS budgets

Secrets (like RDS passwords) are stored securely in SSM Parameter Store.

Terraform injects these secrets into EC2 environment or RDS during deployment.

You connect to the EC2 instance via SSM Session Manager (no SSH, no bastion, no public IP).

The EC2 instance accesses the RDS database privately via VPC.

Private subnets have outbound internet via NAT Gateway for updates and package installs.

All traffic and costs are logged and monitored.

🔐 Key Security Highlights
No public IPs on EC2 or RDS

SSM-based access only

Least privilege IAM roles

Encrypted secrets in Parameter Store

Network segmentation with private subnets

Why This Matters
This setup is designed for real-world enterprise needs: secure, repeatable, manageable, and cost-controlled cloud infrastructure. It aligns with AWS well-architected framework principles and is future-proof for expansion.

--------------------
Learned Lessons.
#VPC.
DNS host_name being applied to my VPC to allow priv ec2 and other AWS services to connect due to DNS hosting. 


#Subnets.
This file creates multiple private and public subnets in our VPC, one subnet per CIDR block in the respective lists.

It distributes subnets across availability zones for redundancy.

Public subnets get automatic public IP mapping; private subnets do not.

All subnets are tagged for easy identification.

#Had to fix duplicate name_prefix --> Terraform throws duplicate key error if same variable is declared more than once.


#Security group.
 core concept in Terraform modularity and variable scoping.
 
Problem:
When using Terraform modules, variable names in the root module and the child module can differ, but you might get confused because you don’t see the exact root variable names (e.g. var.ec2_ingress_rules) used inside the child module. This leads to confusion about whether the variables are connected or missing.

Lesson:
Terraform modules have their own isolated variable namespaces.

The root module declares variables (e.g. ec2_ingress_rules) and passes values to child modules.

When you call a child module, you provide arguments that map root variables to child module variables.

Inside the child module, you refer only to the variables declared within that module (e.g. ingress_rules), which receive their values from the root module.

This means:

var.ec2_ingress_rules exists only in the root module.

var.ingress_rules exists only inside the child module.

Passing ingress_rules = var.ec2_ingress_rules in the module call connects them.

This concept is called:

Variable Scoping in Terraform Modules

or

Terraform Module Variable Namespacing and Passing


#Another issue with tagging - better modularity - look at ec2 tags how it has instance_name and then apply that concept to all other modules. 

Lesson for security group for ec2 & Rds.
Best Practice in Production
In real-world production Terraform, it’s better to:

Create security groups before the resource that uses them
That way, there’s no delay or misconfiguration when the EC2/RDS/etc. resource is provisioned.

Lessons: IAM Role module.
Decided to go for using AWS-managed roles rather than writing my own to ensure security is functional but plan to write my own for practice later for further tightening if required to show iniative. 

Lesson - Debating between KMS integration in my SSM parameter store module as:
I created a single customer-managed KMS key in Terraform to encrypt secrets stored in SSM Parameter Store. While AWS-managed keys are often enough, I wanted tighter control over key policies and the ability to re-use that key across resources in a secure and auditable way.

Lesson for KMS & SSM integration: 
have to re-edit SSM parameter store module so it integrates well with SSM and then for root files. 