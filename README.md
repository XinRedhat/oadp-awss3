# velero-awss3

This script is to help create AWS S3 bucket to store backups in, in the meanwhile, it also create a unique username per the bucket. When the script is done, it will produce a `credentials-velero` file to record access key for this bucket. Regarding the detail, you could reference [Velero plugins for AWS]( https://github.com/vmware-tanzu/velero-plugin-for-aws)

```
./create_bucket.sh <bucket_name>

./delete_bucket.sh <bucket_name>
```