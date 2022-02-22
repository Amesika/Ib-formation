# 01 VPC
resource "aws_vpc" "infra1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
       Name = var.tag_name
    }
}

# 02 Internet Gateway

# 03 Route table

# 04 Subnets

# 05 Association Subnet / Route Table

# 06 Security Group for HTTP and SSH

# 07 Elastic Network Interface (ENI)

# 08 Elastic IP

# 09 EC2 Web Server

# 10 DB Server (Instance RDS)

# 11 DB Subnet Group