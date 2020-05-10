aws_region ?= $(shell curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r ".region")

S3 := aws s3api --region=$(AWS_region)
S3_bucket_name	:= $(shell $(S3) head-bucket --bucket $(app_name) || $(S3) create-bucket --bucket $(app_name); echo $(app_name))


EB := aws elasticbeanstalk --region=$(AWS_region)