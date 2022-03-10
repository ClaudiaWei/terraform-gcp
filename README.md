## Apply changes

pre-requests

* tfenv

dev

```
GOOGLE_APPLICATION_CREDENTIALS=keyfile.json terraform init -backend-config=env/dev/backend.tfvars -reconfigure
GOOGLE_APPLICATION_CREDENTIALS=keyfile.json terraform apply -var-file=env/dev/var.tfvars
```

production

```
GOOGLE_APPLICATION_CREDENTIALS=keyfile.json terraform init -backend-config=env/production/backend.tfvars -reconfigure
GOOGLE_APPLICATION_CREDENTIALS=keyfile.json terraform apply -var-file=env/production/var.tfvars
```