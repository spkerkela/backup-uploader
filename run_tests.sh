#!/usr/bin/env bash

docker compose up -d
sleep 5
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1

ENDPOINT=http://localhost:4566
aws --endpoint-url="$ENDPOINT" s3api create-bucket --bucket test-bucket >> /dev/null
aws --endpoint-url="$ENDPOINT" s3api put-object --bucket test-bucket --key test.txt --body test.txt >> /dev/null

export BACKUP_UPLOADER_TEST=true
go run . --bucket test-bucket -file test.txt
aws --endpoint-url="$ENDPOINT" s3api get-object --bucket test-bucket --key test.txt test-result.txt >> /dev/null
if cmp --silent -- "test.txt" "test-result.txt"; then
    exit 0
else
    exit 1
fi


trap "docker-compose down" EXIT
