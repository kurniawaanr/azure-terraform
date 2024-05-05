# provisioning Azure Kubernetes Service (AKS) with Terraform 

the ideas is to create AKS using terraform. this is just an example of performing simple terraform configuration on Azure

### Prerequisite
- Azure CLI
- Terraform

### First Step
first you should login into your azure using this command :

> az login

and follow the step until you got logged in

then you need to set up a service principal for Terraform. to grant secure, programmatic access to Azure resources for create and manage AKS cluster.

> az ad sp create-for-rbac --name 'sp-terraform' --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

dont forget to define necessary environment variables used by Terraform

> export ARM_CLIENT_ID="<APPID_VALUE>" <br>
 export ARM_CLIENT_SECRET="<PASSWORD_VALUE>" <br>
 export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>" <br>
 export ARM_TENANT_ID="<TENANT_VALUE>" 

 ### Second Step

change you file path into /resource-group and there you have to run this command :

> terraform init

then apply it with :

> terraform apply

now your resource group is created, and ready to deploy AKS in it.

### Third Step

for AKS deployment, i'm using 3 files:
- main-aks.tf = to provision an AKS cluster and node pool
- vars-aks.tf = declare variables required for AKS cluster config
- terraform.tfvars = define variables in vars-aks

create a service principal for AKS with this command :

> az ad sp create-for-rbac --name 'sp-aks-test-001' --skip-assignment

that should show the client id and client secret, copy and paste it to vars-aks.tf 

next step, change your file path into /aks and there you have to run this command :
> terraform init

then run :
> terraform apply

you should see it on your azure that you've already create an AKS cluster.
