#!/bin/bash

set -eu

source smoketest-settings/helpers.sh

host=`setting "web_wallet_endpoint"`
web_wallet_mobile_host=`setting "web_wallet_mobile_endpoint"`
port=`setting "web_wallet_port"`

set +e
for i in {1..15}; do
  echo "Attempt ${i} to curl web wallet"
  curl ${host}:${port}
  status=$?
  curl ${web_wallet_mobile_host}:${port}
  if [[ $status == 0 ]] && [[ $? == 0 ]]; then success="true"; break; fi;
  sleep 1
done
set -e

if [[ "$success" != "true" ]]; then echo "Smoke test failed" && exit 1; fi;
