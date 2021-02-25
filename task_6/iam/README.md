# Notes
- I did not find a way to add wild cardinto trust relantionship policy for the role, it has to be a specific user
- user which is allowed to assume that role is defined in values/dev-kraken.tfvars
- account_id comes from cli param

1. Init

```
terraform init -reconfigure -backend-config values/dev.backend.tfvars -backend-config "key=putit/dev/eu-central-1-kraken.tfstate" -backend-config="profile=putit"
```

2. Apply
```
terraform apply -var account_id=<ACCOUNT_ID> --var-file=values/dev-kraken.tfvars
```

3. Using with a plan 
```
terraform init -reconfigure -backend-config values/dev.backend.tfvars -backend-config "key=putit/dev/eu-central-1-kraken.tfstate" -backend-config="profile=putit" -out plan.out
```

```
terraform apply plan.out
```
