# velero-awss3

This script is to help create AWS S3 bucket as OADP backup storage.Regarding the  steps. In the meanwhile, it also create a unique IAM user for the bucket access. When the script is done, it will produce a `credentials-velero` file and `dpa.yml` file for OADP configuration. Regarding the detail, you could reference [Velero plugins for AWS]( https://github.com/vmware-tanzu/velero-plugin-for-aws)


### Usage:
```
$ export AWS_ACCESS_KEY_ID=<aws_access_key_id>
$ export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>

# Create bucket
$ ./create_bucket.sh <bucket_name>

# Delete bucket
$ ./delete_bucket.sh <bucket_name>
```