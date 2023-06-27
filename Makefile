PROTOBUF_PATH?=.../platform/hooker-grpc/platform/iam/

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
	protoc --proto_path={PROTOBUF_PATH} --go_out=./pb --go-grpc_out=./pb iam-service.proto
