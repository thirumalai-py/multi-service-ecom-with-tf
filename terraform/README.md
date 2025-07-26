# Problem Statement:

pre-req: 

a.) create a S3 bucket manually: terraform-s3-bkend-<your-name>

b.) create a dynamodb table: {Depreciated use S3}

In AWS Management Console:

Create a table with the name terraform-lock-<your-name>.

Use LockID as the partition key (string type).

Create 2 modules:

1.) EC2

2.) S3

Keep these modules inside a modules folder..

Call these modules from the main.tf file which resides inside the folder where you have varibale.tf & provider.tf files as well

Make sure that no where inside our main.tf, we are using any hardcoded values.

Now create environment folder as well and keep env specific backend and tfvar files.

and run terraform commands to provision these service with respect to dev, qa and prod envs.