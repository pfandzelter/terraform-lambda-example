.PHONY: deploy plan clean

deploy: bin.zip main.tf init.done
	terraform apply

plan: bin.zip main.tf init.done
	terraform plan

clean:
	terraform destroy
	rm -f bin.zip bin

init.done:
	terraform init
	touch $@

bin.zip: bin
	zip -j $@ $<

bin: main.go
	go get .
	GOOS=linux GOARCH=amd64 go build -o $@
