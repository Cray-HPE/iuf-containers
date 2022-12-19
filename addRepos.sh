#!/bin/bash
set -e +xv
trap "rm -rf /root/.zypp" EXIT

ARTIFACTORY_USERNAME=$(test -f /run/secrets/ARTIFACTORY_READONLY_USER && cat /run/secrets/ARTIFACTORY_READONLY_USER)
ARTIFACTORY_PASSWORD=$(test -f /run/secrets/ARTIFACTORY_READONLY_TOKEN && cat /run/secrets/ARTIFACTORY_READONLY_TOKEN)

curl -u "${ARTIFACTORY_USERNAME}:${ARTIFACTPRY_PASSWORD}" https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp3/craycli/x86_64/craycli-0.64.0-1.x86_64.rpm -o craycli-0.64.0-1.x86_64.rpm
curl -u "${ARTIFACTORY_USERNAME}:${ARTIFACTPRY_PASSWORD}" https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp2/loftsman-rpm/x86_64/loftsman-1.2.0-1.x86_64.rpm -o loftsman-1.2.0-1.x86_64.rpm
curl -u "${ARTIFACTORY_USERNAME}:${ARTIFACTPRY_PASSWORD}" https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp3/manifestgen/x86_64/manifestgen-1.3.7-1.x86_64.rpm -o manifestgen-1.3.7-1.x86_64.rpm

rpm -i craycli-0.64.0-1.x86_64.rpm
rpm -i loftsman-1.2.0-1.x86_64.rpm
rpm -i manifestgen-1.3.7-1.x86_64.rpm
zypper --non-interactive install git
zypper --non-interactive install jq
