#!/usr/bin/env bash

PROGRAM_NAME=$(basename "$PWD")

tar -czf build/linux/amd64/"$PROGRAM_NAME".tar.gz -C build/linux/amd64/ "$PROGRAM_NAME"
tar -czf build/linux/arm/"$PROGRAM_NAME".tar.gz -C build/linux/arm/ "$PROGRAM_NAME"
tar -czf build/linux/386/"$PROGRAM_NAME".tar.gz -C build/linux/386/ "$PROGRAM_NAME"
tar -czf build/darwin/amd64/"$PROGRAM_NAME".tar.gz -C build/darwin/amd64/ "$PROGRAM_NAME"
tar -czf build/darwin/arm64/"$PROGRAM_NAME".tar.gz -C build/darwin/arm64/ "$PROGRAM_NAME"
tar -czf build/windows/amd64/"$PROGRAM_NAME".tar.gz -C build/windows/amd64/ "$PROGRAM_NAME".exe
