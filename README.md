# Terraform + Golang AWS Lambda

This is a minimal Hello World example of deploying a AWS Lambda function. The function is written in Go and deployment is automated with Terraform.

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [References](#references)

## Prerequisites

### Terraform and Go

Install [Terraform][terraform] and [Go][golang]. On macOS with Homebrew:

```console
$ brew install go terraform
```

[terraform]: https://www.terraform.io/
[golang]: https://www.terraform.io/

### AWS credentials

Configure your AWS access key and secret key with the `aws configure` command, or just create a file `~/.aws/credentials` containing the keys:

```
[default]
aws_access_key_id = KEY
aws_secret_access_key = KEY
```

The access key ID and the secret access key can be generated in the AWS management console.

### AWS region

The environment variable `AWS_DEFAULT_REGION` should be set to your favorite region. `us-east-1` would just work if you are not sure:

```console
$ export AWS_DEFAULT_REGION=us-east-1
```

This environment variable is used by the [Terraform AWS provider][terraform-aws].

[terraform-aws]: https://www.terraform.io/docs/providers/aws/

## Usage

Run `make` to build and deploy an API:

```console
$ make
```

In the process Terraform will ask you for a name for your deployment, you can enter "go-lambda" for example. Type `yes` when Terraform asks your for confirmation. Everything should finish in less than a minute!

If you're unsure, you can also run `make plan` to see what the effects of your deployment would be:

```console
$ make plan
```

Cleanup:

```console
$ make clean
```

Make sure to enter the same variable values as during deployment!

### About the Makefile

The Makefile is for convenience and does nothing special. It just runs following commands for you:

```console
$ terraform init
$ go get .
$ GOOS=linux GOARCH=amd64 go build -o bin
$ zip bin.zip bin
$ terraform apply
$ terraform destroy
```

## References

### Lambda

- [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Building Lambda Functions](https://docs.aws.amazon.com/lambda/latest/dg/lambda-app.html)

### Terraform

- [Terraform AWS provider](https://www.terraform.io/docs/providers/aws/)
