# Getting started

This step does nothing, it's just an initial configuration setup to make sure we get Terraform working right with Azure.

We will configure Terraform remote state here - a powerful functionality that will make sure it's not possible for two people to be working at the same time by using **locks**. This is crucial in any real world scenario. Azure blob storage also encrypts the state for us, which is pretty cool.

## How to run?

Replace "$name" in all files with your first and last name (e.g. $name) as per step 0.

Configure the access key to the Blob Storage where you will store the Azure state files. Make sure it is in ARM_ACCESS_KEY environment variable (check script from step 0).

`terraform init` followed by `terraform plan` should show you Terraform at work, but do no changes to your subscription.

## What should I have at the end of this step?

- An azure subscription with a Resource Group named $name-terraform-tutorial, containing a Storage Account named $nameterraformstate.
- Terraform configured and stating "no changes" when you run a plan.