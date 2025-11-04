# terraform-aws-three-tier-architecture-project
terraform-aws-three-tier-architecture-project
# ### terraform-aws-three-tier-architecture

This immersive workshop guides you through building a **three-tier web architecture on AWS using Terraform**. The project automates the provisioning of **networking, security, compute, and data layers**, resulting in a resilient and highly scalable infrastructure.

![3-Tier Architecture](https://github.com/user-attachments/assets/abd4751a-482e-4f5d-9fc3-0b85347a0f7c)

---

## 🏗️ Architecture Overview

### 1️⃣ Public-Facing Application Load Balancer (ALB)
- Accepts external HTTP/S traffic.
- Routes requests to EC2 instances in the **Web Tier**.

### 2️⃣ Web Tier – EC2 Instances with Nginx & React.js
- Serves static files and frontend content.
- Forwards API requests to an **Internal ALB**.

### 3️⃣ Internal Application Load Balancer
- Receives API calls from the Web Tier.
- Routes traffic to backend services in the App Tier.

### 4️⃣ Application Tier – EC2 Instances with Node.js
- Handles business logic and service processing.
- Connects to the **Aurora MySQL database**.

### 5️⃣ Data Layer – Aurora MySQL (Multi-AZ)
- Fault-tolerant, highly available database.
- Multi-AZ setup ensures durability and disaster recovery.

### 6️⃣ Return Flow
- App Tier → Internal ALB → Web Tier → Public ALB → Client

---

## 📈 Scalability and Resilience

| Component               | Role                                                                 |
|------------------------|----------------------------------------------------------------------|
| **Load Balancers**      | Manage incoming traffic and route it efficiently                    |
| **Health Checks**       | Detect and replace unhealthy instances                              |
| **Auto Scaling Groups** | Scale resources dynamically based on demand                         |

---

## 🔧 Project Breakdown

### Part 1: Networking and Security
- VPC, Subnets, Route Tables
- Internet & NAT Gateways
- Security Groups

### Part 2: Database Deployment
- Subnet Groups
- Aurora MySQL (Multi-AZ)

### Part 3: App Tier Deployment
- EC2 Instance with Node.js
- Database schema setup
- Connectivity validation

### Part 4: Internal Load Balancer & Auto Scaling
- AMI from App Tier
- Launch Template & Autoscaling
- Internal ALB Deployment

### Part 5: Web Tier Deployment
- Nginx Configuration
- React frontend setup
- EC2 Deployment

### Part 6: External Load Balancer & Auto Scaling
- AMI from Web Tier
- Launch Template & Autoscaling
- Public ALB Deployment

---

## 🚀 Getting Started

Clone the repo and spin up your infrastructure using Terraform:

```bash
git clone https://github.com/SatishThapak/terraform-aws-three-tier-architecture.git
cd terraform-aws-three-tier-architecture

terraform validate       # Validate config changes
terraform init           # Initialize Terraform working directory
terraform plan           # Preview planned changes
terraform apply          # Apply changes and deploy infra