FROM quay.io/loftsman/loftsman-cli:1.2.0
COPY /usr/bin/loftsman . 

FROM artifactory.algol60.net/csm-docker/unstable/cray-craycli:0.64.0-20221101213247_b8121f3

