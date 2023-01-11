#!/usr/bin/env bash

GOOS=windows GOARCH=amd64 go build -o build/windows/amd64/backup-uploader.exe
GOOS=darwin GOARCH=amd64 go build -o build/darwin/amd64/backup-uploader
GOOS=darwin GOARCH=arm64 go build -o build/darwin/arm64/backup-uploader
GOOS=linux GOARCH=amd64 go build -o build/linux/amd64/backup-uploader
GOOS=linux GOARCH=arm go build -o build/linux/arm/backup-uploader
GOOS=linux GOARCH=386 go build -o build/linux/386/backup-uploader