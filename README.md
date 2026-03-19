# Azure DevOps End-to-End Infrastructure & CI/CD Hub

A professional DevSecOps workflow demonstrating Infrastructure as Code (IaC) deployment to Azure and subsequent application deployment using Azure DevOps pipelines.

## Architecture Overview

This project provisions the following Azure resources via Terraform:
- **Resource Group:** Logical container for all resources.
- **App Service Plan:** Underlying compute (Linux B1 tier).
- **Web App:** Hosts the Python Flask application.

State is managed via an Azure Storage Account container with locking enabled.

## Project Structure

```text
.
├── app/                  # Application source code (Python/Flask)
│   ├── app.py
│   └── requirements.txt
├── infra/                # Infrastructure as Code (Terraform)
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── pipelines/            # Azure DevOps CI/CD definitions
│   └── azure-pipelines.yml
├── .gitignore
└── README.md
```

## Setup Instructions

1. **Azure Pre-requisites:**
   - Create a Service Principal for Azure DevOps to deploy resources.
   - Create a Resource Group, Storage Account, and Container for Terraform State backend.

2. **Azure DevOps Setup:**
   - Create an Azure Resource Manager service connection named in your pipeline (e.g., `azureServiceConnection`).
   - Create a Variable Group named `dev-vg` linking to Azure Key Vault (recommended) or holding the following variables:
     - `azureServiceConnection`: Service Connection Name
     - `tfStateResourceGroup`: Resource Group for state
     - `tfStateStorageAccount`: Storage Account for state
     - `tfStateContainer`: Container for state
     - `tfStateKey`: State file name (e.g., `dev.terraform.tfstate`)
     - `webAppName`: The name of the Web App deployed (matching Terraform output)

3. **Pipeline Execution:**
   - Register the YAML pipeline located at `pipelines/azure-pipelines.yml` in Azure DevOps.
   - Run the pipeline to build, scan (tfsec), provision infrastructure, and deploy the app.
  
   Author
   Theodor B.
