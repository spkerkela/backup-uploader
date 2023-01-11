#!/usr/bin/env bash

tar -czf build/linux/amd64/backup-uploader.tar.gz -C build/linux/amd64/ backup-uploader
tar -czf build/linux/arm/backup-uploader.tar.gz -C build/linux/arm/ backup-uploader
tar -czf build/linux/386/backup-uploader.tar.gz -C build/linux/386/ backup-uploader
tar -czf build/darwin/amd64/backup-uploader.tar.gz -C build/darwin/amd64/ backup-uploader
tar -czf build/darwin/arm64/backup-uploader.tar.gz -C build/darwin/arm64/ backup-uploader
tar -czf build/windows/amd64/backup-uploader.tar.gz -C build/windows/amd64/ backup-uploader.exe
