#!/bin/bash
set -e +xv
trap "rm -rf /root/.zypp" EXIT

SLES_REPO_USERNAME=$(cat /run/secrets/SLES_REPO_USERNAME)
SLES_REPO_PASSWORD=$(cat /run/secrets/SLES_REPO_PASSWORD)
CSM_RPMS_HPE_STABLE="https://${SLES_REPO_USERNAME:-}${SLES_REPO_PASSWORD+:}${SLES_REPO_PASSWORD}@artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/"
ARCH=x86_64
zypper --non-interactive rr --all
zypper --non-interactive ar ${CSM_RPMS_HPE_STABLE}/sle-15sp2/?auth=basic CSM-SLE-15SP2
zypper --non-interactive ar ${CSM_RPMS_HPE_STABLE}/sle-15sp3/?auth=basic CSM-SLE-15SP3
zypper update -y
zypper install -y craycli loftsman manifestgen git jq
zypper clean -a && zypper --non-interactive rr --all && rm -f /etc/zypp/repos.d/*


