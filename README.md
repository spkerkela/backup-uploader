# Backup uploader

Utility tool for sending files to s3 with a filter (planned to be used as a reaction to filesystem events, such as when a new file is added to a directory)

```
Usage of backup-uploader:
   -bucket string
        Bucket to upload to (default "backups")
  -file string
        File to upload (default "file")
  -filter string
        Only send files matching this filter
  -prefix string
        path in bucket to upload to (default "path")
```