KUBESCAPE_THRESHOLD=80

all: kubescape promtool-lint

.PHONY: kubescape
kubescape: 
	kubescape scan -s framework -v -t $(KUBESCAPE_THRESHOLD) nsa manifests/*.yaml

.PHONY: promtool-lint
promtool-lint: promrules.yml
	$(shell) promtool check rules promrules.yml

.PHONY: promrules.yml
promrules.yml:
	scripts/extract-promrules.sh