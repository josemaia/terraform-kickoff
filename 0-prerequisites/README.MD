# Prerequisites

This step configures your local CLI and creates some resources we need before we dive into Infrastructure as Code with Terraform properly.

Please make sure before this step you have the Azure login properly configured. This can be done with `az login` followed by `az account set --subscription "YOUR_ID_HERE"`.

Check the bash script for more details.

## What should I have at the end of this step?

- An azure subscription with a Resource Group named $name-terraform-tutorial, containing a Storage Account named $nameterraformstate.