BIN_DIR?=$(shell pwd)/tmp/bin

KUBESCAPE_BIN=$(BIN_DIR)/kubescape

TOOLING=$(KUBESCAPE_BIN)

all: setup-workspace

.PHONY: setup-workspace
setup-workspace: 
	GO111MODULE=on go get github.com/prometheus/prometheus/cmd/promtool@release-2.26
	export PATH=$(PATH):$(PWD)/tmp/bin

.PHONY: kubescape
kubescape: $(KUBESCAPE_BIN) ## Runs a security analysis on generated manifests - failing if risk score is above threshold percentage 't'
	$(KUBESCAPE_BIN) scan -s framework -t $(KUBESCAPE_THRESHOLD) nsa manifests/*.yaml --exceptions 'kubescape-exceptions.json'

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(TOOLING): $(BIN_DIR)
	@echo Installing tools from tools.go
	@cat tools.go | grep _ | awk -F'"' '{print $$2}' | xargs -tI % go build -modfile=go.mod -o $(BIN_DIR) %