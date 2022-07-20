# observability

Repository used to host a set of YAML files to be used as source of truth for our observability stack deployed in several environments.

## Linters

You can run all linters by running:

```
make lint
```

Or you can run them individually

### Prometheus alerts and recording rules

You can verify if alerting rules are valid by running.

```
make lint/rules
```

For every `PrometheusRule` YAML file inside the `manifest` folder, it will extract all the rules and run `promtool check rules` against it.

### All alerts have required labels and annocations

You can verify that every alert has all the required labels, which are:
* Labels: `severity`
* Annotations: `runbook_url` and `description`

```
make lint/alert-labels
```


## CI Roadmap

* Linters
    * Alertmanager config
    * YAML
* Enforcers
    * All alerts with team label, should be one of: [`platform`, `ide`, `webapp`, `workspace`]
* Integration tests
    * Alertmanager routing to expected routes
* Periodic version upgrades
* Kubescape security scanning
