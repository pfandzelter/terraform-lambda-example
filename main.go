package main

import (
	"context"
	"log"

	"github.com/aws/aws-lambda-go/lambda"
)

func handleRequest(ctx context.Context) {
	log.Print("Hello Gopher!")
}

func main() {
	lambda.Start(handleRequest)
}
