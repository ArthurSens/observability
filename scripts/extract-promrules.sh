#!/bin/bash

echo "groups:" > promrules.yml

for file in $(find manifests -regex ".*\.y[a]?ml"); do
    kind=$(yq '.kind' $file)
    if [[ $kind == "PrometheusRule" ]]; then
      yq '.spec.groups' $file >> promrules.yml
    fi
done

