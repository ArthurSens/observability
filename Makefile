KUBESCAPE_THRESHOLD=80

all: kubescape promtool-lint

.PHONY: kubescape
kubescape: 
	kubescape scan -s framework -v -t $(KUBESCAPE_THRESHOLD) nsa manifests/*.yaml

.PHONY: promtool-lint
promtool-lint: 
	promtool version
