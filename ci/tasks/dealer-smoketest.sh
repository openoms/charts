#!/bin/bash

set -eu

source smoketest-settings/helpers.sh

host=`setting "dealer_endpoint"`
port=`setting "dealer_port"`

set +e
for i in {1..15}; do
  echo "Attempt ${i} to curl dealer's /metrics endpoint"
  curl ${host}:${port}/metrics
  if [[ $? == 0 ]]; then success="true"; break; fi;
  sleep 1
done
set -e

if [[ "$success" != "true" ]]; then echo "Smoke test failed" && exit 1; fi;
