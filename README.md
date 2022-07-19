# observability

Repository used to host a set of YAML files to be used as source of truth for our observability stack deployed in several environments.

## Linters

### Prometheus alerts and recording rules

You can verify if alerting rules are valid by running.

```
make promtool-lint
```

For every `PrometheusRule` YAML file inside the `manifest` folder, it will extract all the rules and run `promtool check rules` against it.

## CI Roadmap

* Linters
    * Alertmanager config
    * YAML
* Enforcers
    * All alerts have severity
    * All alerts have description
    * All alerts with team label, should be one of: [`platform`, `ide`, `webapp`, `workspace`]
* Integration tests
    * Alertmanager routing to expected routes
* Periodic version upgrades
* Kubescape security scanning
