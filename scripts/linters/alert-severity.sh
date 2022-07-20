#!/bin/bash

echo "" > scripts/linters/alerts.yml

for file in $(find manifests -regex ".*\.y[a]?ml"); do
    kind=$(yq '.kind' $file)
    if [[ $kind == "PrometheusRule" ]]; then
      hasSeverity=$(yq '.spec.groups[].rules | select (.[] | has("alert")) | .[].labels | has("severity")' $file)

      # We use *false* because the command above prints one single string containing severity of all alerts from the same file
      if [[ ${hasSeverity} == *"false"* ]]; then
        echo "${file} contains alerts without 'severity' label, which is required!"
        exit 1
      fi
    fi
done