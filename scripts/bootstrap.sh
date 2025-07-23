#!/bin/bash
# Update the system
yum update -y

# Install CloudWatch Agent
yum install -y amazon-cloudwatch-agent

# Install and start the SSM Agent (for remote access)
yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Optional Docker installation (commented out)
# yum install -y docker
# systemctl enable docker
# systemctl start docker
# usermod -aG docker ec2-user
