#!/usr/bin/env bash

PROGRAM_NAME=$(basename "$PWD")

GOOS=windows GOARCH=amd64 go build -o build/windows/amd64/"$PROGRAM_NAME".exe
GOOS=darwin GOARCH=amd64 go build -o build/darwin/amd64/"$PROGRAM_NAME"
GOOS=darwin GOARCH=arm64 go build -o build/darwin/arm64/"$PROGRAM_NAME"
GOOS=linux GOARCH=amd64 go build -o build/linux/amd64/"$PROGRAM_NAME"
GOOS=linux GOARCH=arm go build -o build/linux/arm/"$PROGRAM_NAME"
GOOS=linux GOARCH=386 go build -o build/linux/386/"${PROGRAM_NAME}"