GOPROXY=https://goproxy.interticket.com

PROTOBUF_PATH?=/Users/nagyk/Developer/platform/hooker-grpc

.PHONY: generate

default: generate

update:
	git submodule update --init --remote --force

clean:
	rm -Rf pkg/pb

generate: clean update gen
	go mod tidy
	git add .

gen:
	protoc --proto_path=/Users/nagyk/Developer/platform/hooker-grpc/platform/iam/ --go_out=./pb --go-grpc_out=./pb iam-service.proto
