#!/bin/bash

echo "groups:" > promrules.yml

for file in $(find manifests -regex ".*\.y[a]?ml"); do
    kind=$(yq r $file 'kind')
    if [[ $kind == "PrometheusRule" ]]; then
      yq r $file 'spec.groups' >> promrules.yml
    fi
done

