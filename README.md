# 🚀 AWS EC2 Deployment using Terraform

## 📌 Project Overview
This project demonstrates how to provision an AWS EC2 instance using Terraform with secure configurations.

## ⚙️ Technologies Used
- AWS EC2
- Terraform
- Linux (Amazon Linux)
- SSH

## 🔐 Security Features
- SSH access restricted to specific IP
- HTTP access enabled for web hosting
- Key-based authentication

## 🚀 Steps Performed
1. Configured AWS provider
2. Created EC2 instance (t2.micro / t3.micro)
3. Configured Security Groups (ports 22 & 80)
4. Connected via SSH
5. Installed Apache and hosted a webpage

## 🧪 Validation
- Verified open ports using `ss -tulnp`
- Checked logs in `/var/log/httpd/access_log`
- Tested using `curl localhost`

## 📷 Output
Successfully deployed a web server using Terraform on AWS.

## Key Security Point
SSH in production environment should be restricted to specific IP.

---

## 💡 Author
Bhavneet Singh
