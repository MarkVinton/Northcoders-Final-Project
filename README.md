# Team-RYMP-Project
Welcome to Team RYMP's final project.
This READ ME will walk you through how to setup and utilise our project.

This Project will allow the user to deploy a full-stack application to the AWS cloud and be able to interact with it.

We have created a fully functioning infrastructure using Infrastrcutre as Code(IAC) via Terraform. To use this code make sure you have terraform installed and have authorised your terminal with your AWS credentials.

Then enter,
```
terraform init
```
Followed by,
```
terraform plan
```
And finally 
```
terraform apply
```
This proccess can take at least 15 to 20 minutes so please be patient.

Once the terraform has applied you now are ready to deplpoy the application onto the EKS cluster created via terraform but first you need to alter your kubernetes context. This can be done by using this code snippet.

Remember to replace 'eu-west-2' with your region and 'rymp-eks-cluster' with the name you have changed your EKS cluster to. If you are using the same regoin and cluster names then no changes are neccessary.
```
aws eks --region eu-west-2 update-kubeconfig --name rymp-eks-cluster
```
