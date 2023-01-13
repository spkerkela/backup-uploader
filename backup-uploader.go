package main

import (
	"context"
	"flag"
	"log"
	"os"
	"path/filepath"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"

	"github.com/aws/aws-sdk-go-v2/service/s3"
)

func main() {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err != nil {
		log.Fatal("Could not load AWS config")
	}
	bucketName := flag.String("bucket", "backups", "Bucket to upload to")
	prefix := flag.String("prefix", "path", "path in bucket to upload to")
	fileName := flag.String("file", "file", "File to upload")
	filter := flag.String("filter", "", "Only send files matching this filter")
	flag.Parse()

	client := s3.NewFromConfig(cfg)

	fileToSend, err := os.Open(*fileName)
	if err != nil {
		log.Fatal("Could not read file:", err.Error())
	}

	fileNameOnly := filepath.Base(*fileName)
	if *filter != "" {
		if matched, _ := filepath.Match(*filter, fileNameOnly); !matched {
			log.Printf("Skipping file %s, does not match filter %s", fileNameOnly, *filter)
			os.Exit(0)
		}
	}
	_, err = client.PutObject(context.TODO(), &s3.PutObjectInput{
		Bucket: aws.String(*bucketName),
		Key:    aws.String(*prefix + "/" + fileNameOnly),
		Body:   fileToSend,
	})

	if err != nil {
		log.Fatal("Could not upload file:", err.Error())
	}

	log.Println("Upload complete")
}
