KUBESCAPE_THRESHOLD=80

all: kubescape lint

.PHONY: kubescape
kubescape: 
	kubescape scan -s framework -v -t $(KUBESCAPE_THRESHOLD) nsa manifests/*.yaml

lint: lint/rules lint/alert-severity

.PHONY: lint/rules
lint/rules: promrules.yml
	$(shell) promtool check rules promrules.yml

lint/alert-severity:
	scripts/linters/alert-severity.sh

.PHONY: promrules.yml
promrules.yml:
	scripts/extract-promrules.sh