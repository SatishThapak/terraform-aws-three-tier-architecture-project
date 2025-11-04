# 🌐 3-Tier Web Application Architecture on AWS

This repository demonstrates a scalable and highly available 3-tier architecture deployed on AWS. It separates concerns across the web, application, and database tiers to ensure modularity, performance, and resilience.

---

## 🧱 Architecture Overview

In this architecture:

- A **public-facing Application Load Balancer (ALB)** routes client traffic to the **Web Tier**.
- The **Web Tier** consists of EC2 instances running **Nginx**, which:
  - Serve a **React.js** frontend
  - Proxy API requests to the **Application Tier**
- An **internal-facing ALB** forwards API traffic to the **Application Tier**, which:
  - Runs **Node.js** services
  - Processes business logic and interacts with the database
- The **Database Tier** uses **Amazon Aurora MySQL (Multi-AZ)** for high availability and data durability.

Each tier is protected and scaled using **Auto Scaling Groups**, **Health Checks**, and **Load Balancers**.

---

## 📊 Architecture Diagram

![3-Tier Architecture](https://github.com/user-attachments/assets/abd4751a-482e-4f5d-9fc3-0b85347a0f7c)

---

## 🚀 Technologies Used

- **Frontend**: React.js
- **Web Server**: Nginx on EC2
- **Backend**: Node.js on EC2
- **Database**: Amazon Aurora MySQL (Multi-AZ)
- **Load Balancing**: AWS Application Load Balancer (public and internal)
- **Scaling & Resilience**: Auto Scaling Groups, Health Checks

---

## 📦 Project Structure

. ├── web-tier/ │ └── react-app/ ├── app-tier/ │ └── node-api/ ├── infra/ │ └── terraform/ or cloudformation/ └── README.md


---

## 🛠️ Deployment Notes

- Ensure your AWS environment is configured with appropriate IAM roles and VPC setup.
- Use Terraform or CloudFormation templates in the `infra/` directory to provision infrastructure.
- Deploy the React app to the web-tier EC2 instances and configure Nginx to serve it.
- Set up Nginx to proxy `/api` routes to the internal ALB.
- Deploy Node.js services to the app-tier EC2 instances.
- Connect the app-tier to the Aurora MySQL cluster using secure credentials.

---

## 📌 Best Practices

- Use **HTTPS** with SSL termination at the public ALB.
- Enable **CloudWatch monitoring** and **logging** for all tiers.
- Apply **security groups** and **network ACLs** to restrict access between tiers.
- Use **parameter store** or **Secrets Manager** for managing sensitive data.

---

## 📄 License

This project is licensed under the MIT License.

---

## 🙌 Contributions

Feel free to fork this repo, submit issues, or open pull requests to improve the architecture or documentation.

