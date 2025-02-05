#!/bin/bash
set -e +xv
trap "rm -rf /root/.zypp" EXIT

SLES_REPO_USERNAME=$(cat /run/secrets/SLES_REPO_USERNAME)
SLES_REPO_PASSWORD=$(cat /run/secrets/SLES_REPO_PASSWORD)
CSM_RPMS_HPE_STABLE="https://${SLES_REPO_USERNAME:-}${SLES_REPO_PASSWORD+:}${SLES_REPO_PASSWORD}@artifactory.algol60.net/artifactory/csm-rpms/hpe/stable"
SLES_MIRROR="https://${SLES_REPO_USERNAME:-}${SLES_REPO_PASSWORD+:}${SLES_REPO_PASSWORD}@artifactory.algol60.net/artifactory/sles-mirror"
ARCH=x86_64
zypper --non-interactive rr --all
zypper --non-interactive ar ${SLES_MIRROR}/Products/SLE-Module-Basesystem/15-SP6/${ARCH}/product?auth=basic sles15sp6-Module-Basesystem-product
zypper --non-interactive ar ${SLES_MIRROR}/Updates/SLE-Module-Containers/15-SP6/${ARCH}/update?auth=basic sles15sp6-Module-Containers-update
zypper --non-interactive ar --no-gpgcheck ${CSM_RPMS_HPE_STABLE}/sle-15sp6/?auth=basic CSM-SLE-15SP6
zypper --non-interactive ar --no-gpgcheck ${CSM_RPMS_HPE_STABLE}/noos/?auth=basic CSM-noos
zypper update -y
zypper install -y craycli loftsman manifestgen git-core jq curl
zypper clean -a && zypper --non-interactive rr --all && rm -f /etc/zypp/repos.d/*

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
