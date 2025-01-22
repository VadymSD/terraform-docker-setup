# GO-TO-DO Application Terraform Setup

This README provides instructions for setting up the go-to-do application using Terraform, with modules for different components including images, containers, and networks. The application comprises a backend, an Nginx server configured with SSL, and a frontend.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed on your local machine
- Ensure you add the following SSL files to the `ssl` directory to enable Nginx with SSL:
  - `nginx-selfsigned.crt`
  - `nginx-selfsigned.key`
- Create the `terraform.tfstate` file
- Add the required variable values to the `terraform.tfstate` file

## Deployment Steps

### 1. Initialize Terraform

Run the following command in the root directory of your Terraform project to initialize Terraform:

```bash
terraform init
```

### 2. Plan the Deployment

Generate a plan to review the resources that will be created:

```bash
terraform plan
```

### 3. Apply the Configuration

Apply the Terraform configuration to deploy the application:

```bash
terraform apply
```

## Cleanup

To destroy the infrastructure, run:

```bash
terraform destroy
```
## Application Reference
For application reference, visit [Link](https://github.com/schadokar/go-to-do-app)