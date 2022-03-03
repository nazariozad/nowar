### Set AWS Credentials in Linux Shell:
```
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
export AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
```

### Create var file
Create ver file with name `run.tfvars` with the following content.
Fill region and urls.
```terraform
region="us-east-1"
urls = [
  "https://nowar.com",
]
```

### Init terraform
```
terraform init
```

### Run terraform
```bash
# check you filled vars properly
terraform plan -var-file=run.tfvars

# apply
terraform apply -var-file=run.tfvars
```

### Destroy after few hours
```
terraform destroy
```