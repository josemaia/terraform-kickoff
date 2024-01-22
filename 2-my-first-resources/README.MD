# My first resources

In this step, we will create a virtual machine and a PostgreSQL database.

## How to run?

Replace "$name" in all files with your first and last name (e.g. $name) as per step 0.

Configure the access key to the Blob Storage where you will store the Azure state files. Make sure it is in ARM_ACCESS_KEY environment variable (check script from step 0).

`terraform init` followed by `terraform plan -var project_name=ctwsummit` and `terraform apply -var project_name=ctwsummit` should create the necessary resources.

## What should I have at the end of this step?

- An azure subscription with a Resource Group named $name-terraform-tutorial, containing a Storage Account named $nameterraformstate.
- Terraform creating the mentioned resources, with the CLI outputting some information on them.

Once you have validated all is OK, you should run `terraform destroy` and delete the Resource Group in Azure to make sure there are no additional costs.

Any remaining workshop time can be used to iterate on this, together with the support from the trainer, or to discuss as a group your experience with Terraform. You can experiment with creating other types of resources, chaining things together, using dependencies, count and foreach, null_resources... Terraform is a very powerful and complex tool.
