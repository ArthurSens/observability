# observability

Repository used to host a set of YAML files to be used as source of truth for our observability stack deployed in several environments.

## CI Roadmap

* Linters
    * Prometheus rules
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
