# This is Development Environment  
## Components
The components of the environment are defined in the `main.tf` file.  
## Global Variables
They are some global variables that are available for use on any file inside this environment. They are defined in the `variables.tf` file.  

## Additional Resources  
----------

## Instructions 

1. Clone the repo

1. Create a file named "creds" with the following structure and add your account information inside aws-scripts
  - export AWS_ACCESS_KEY_ID=xxxxxx
  - export AWS_SECRET_ACCESS_KEY=xxxxx
  - export AWS_DEFAULT_REGION=us-east-1


1. Source the file  
  - . ./creds

1. Initialize terraform
  - terraform init


1. Run the following command to create an execution plan
  - terraform plan -out informatux_poc

1. Execute the terraform plan
  - terraform apply informatux_poc

1. Connect to the AWS console and watch the VPCs and PoC instance get created

1. To delete the created VPCs create a terraform plan to destroy them
  - terraform plan -destroy -out remove.info

1. Apply the destroy plan
  - terraform apply remove.info
