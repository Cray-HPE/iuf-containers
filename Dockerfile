FROM quay.io/loftsman/loftsman-cli:1.2.0 AS loft

FROM artifactory.algol60.net/csm-docker/stable/cray-craycli:0.64.1
COPY --from=loft /usr/bin/loftsman /usr/bin/loftsman
RUN apk update && apk add git