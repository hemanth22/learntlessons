## Terraform Command

## Terraform Init

```bash
terraform init
```

## Terraform validation


```bash
terraform validate
```

## Terraform plan configuration 

```bash
terraform plan
```

## Terraform save the plan

```bash
terraform plan -out=tfplan
```

## Terraform command to display destroy plan

```bash
terraform plan -destroy
```

## Terraform Apply Command

This will ask for approval

```bash
terraform apply 
```

This will auto apply without asking approval

```bash
terraform apply --auto-approve
```

This command help to apply the plan which has been saved.

```bash
terraform apply "tfplan"
```

## Terraform Destroy

```bash
terraform destroy
```

```bash
terraform destroy --auto-approve
```

```bash
terraform plan -destroy -out=tfdestroy
terraform apply "tfdestroy"
```

## Terraform command for state file 

```
 terraform state list
```

## terraform structure

```
terraform.tfstate --> state file which created after apply
main.tf --> terraform configuration file
.terraform.lock.hcl --> terraform state lock file 
```

## terraform configuration syntax

```
Hashicorp language (HCL) -> Terraform -> Blocks, Arguments, Identifiers, Comments 
```

## Terraform Language Structure

```mermaid
flowchart TD
    A[Hashicorp language] --> B(Terraform)
    B --> C{Terraform}
    C --> D[Blocks]
    C --> E[Arguments]
    C --> F[Identifiers]
    C --> G[Comments]


## Explain about terraform syntax


```text
# Templat
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # BLOCK body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

# Azure Example
# Create a resource group

resource "azurerm_resource_group" "myrg" { # Resource BLOCK
  name = "myrg-1" # Argument
  location = "East US" # Argument
}
```

## Terraform comments

```text
# Use can use hash as a comments

// Use this way as well

/*
THis is multi line comment
*/
```

