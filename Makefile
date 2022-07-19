KUBESCAPE_THRESHOLD=80

all: kubescape promtool-lint

.PHONY: kubescape
kubescape: 
	kubescape scan -s framework -t $(KUBESCAPE_THRESHOLD) nsa manifests/*.yaml --exceptions 'kubescape-exceptions.json'

.PHONY: promtool-lint
promtool-lint: 
	promtool version