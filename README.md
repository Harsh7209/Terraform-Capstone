# 🚀 Terraform Multi-Environment Infrastructure

This repository demonstrates a **production-ready Terraform setup** for managing infrastructure across multiple environments like **dev, staging, and production** using a clean and scalable architecture.

---

## 📌 Project Overview

This project showcases how to:

* Manage **multiple environments** using Terraform
* Keep infrastructure **modular and reusable**
* Maintain **environment isolation**
* Follow **best practices for IaC (Infrastructure as Code)**

---

## 🏗️ Architecture

The repository is structured to support **multi-environment deployments**:

```
terraform-multi-env/
│
├── modules/              # Reusable Terraform modules
│
├── environments/
│   ├── dev/              # Development environment
│   ├── staging/          # Staging environment
│   └── prod/             # Production environment
│
├── main.tf               # Root configuration
├── variables.tf          # Input variables
├── outputs.tf            # Output values
└── provider.tf           # Provider configuration
```

---

## ⚙️ How It Works

* Each environment has its **own configuration and variables**
* Shared logic is placed inside **modules**
* Infrastructure is deployed using the same code but **different inputs**
* Ensures:

  * No duplication
  * Better maintainability
  * Environment isolation

---

## 🚀 Getting Started

### 1️⃣ Prerequisites

* Install Terraform
* Configure your cloud provider (AWS/GCP/Azure)

---

### 2️⃣ Initialize Terraform

```bash
terraform init
```

---

### 3️⃣ Select Environment

```bash
cd environments/dev
```

---

### 4️⃣ Plan Infrastructure

```bash
terraform plan
```

---

### 5️⃣ Apply Changes

```bash
terraform apply
```

---

## 🔁 Multi-Environment Workflow

1. Develop in **dev**
2. Test in **staging**
3. Deploy to **production**

Example:

```bash
git checkout dev
git push origin dev
```

---

## 📦 Key Features

* Modular Terraform design
* Multi-environment support
* Clean directory structure
* Scalable architecture
* Easy environment switching

---

## 🧠 Best Practices Followed

* Use **modules for reusability**
* Keep **state isolated per environment**
* Avoid hardcoding values
* Use **separate variable files**
* Maintain **clean Git workflow**

---

## 🔒 Remote State (Optional)

```hcl
terraform {
  backend "s3" {}
}
```

Initialize with:

```bash
terraform init -backend-config=dev.hcl
```

---

## 📈 Future Improvements

* Add CI/CD (GitHub Actions)
* Integrate Terraform Cloud
* Add monitoring & logging
* Use Terragrunt for DRY configs

---

## 👨‍💻 Author

**Harsh Choubey**

---

## ⭐ Support

If you like this project, give it a ⭐ on GitHub!
