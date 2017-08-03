# This is Development Environment  
## Components
The components of the environment are defined in the `main.tf` file.  
## Global Variables
They are some global variables that are available for use on any file inside this environment. They are defined in the `variables.tf` file.  

## Additional Resources  
----------

## Instructions for dev_vpc VPC

1. Clone the repo

1. Create a file named "creds" with the following structure and add your account information inside aws-scripts
  - export AWS_ACCESS_KEY_ID=xxxxxx
  - export AWS_SECRET_ACCESS_KEY=xxxxx
  - export AWS_DEFAULT_REGION=us-east-1


1. Source the file  
  - . ./creds

1. Initialize terraform
  - terraform init

After you've performed this step make sure that the repo is tied to the s3 bucket, you should see a message like this:


  - **Downloading modules (if any)...**
  - **Get: git::https://github.com/terraform-community-modules/tf_aws_vpc.git**
  - **Initializing the backend...**


  - **Successfully configured the backend "s3"! Terraform will automatically**
  - **use this backend unless the backend configuration changes.**

  - **Terraform has been successfully initialized!**


1. Run the following command to create an execution plan
  - terraform plan -out dev_vpc

1. Execute the terraform plan
  - terraform apply dev_vpc

1. Connect to the AWS console and watch the VPCs get created

1. To delete the created VPCs create a terraform plan to destroy them
  - terraform plan -destroy -out remove_dev_vpc

1. Apply the destroy plan
  - terraform apply remove_dev_vpc