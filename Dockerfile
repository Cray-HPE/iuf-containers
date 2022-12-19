FROM opensuse/leap:15.3

COPY addRepos.sh /
RUN --mount=type=secret,id=ARTIFACTORY_READONLY_USER --mount=type=secret,id=ARTIFACTORY_READONLY_TOKEN ./addRepos.sh && rm /addRepos.sh

COPY ./bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENV  LC_ALL=C.UTF-8, LANG=C.UTF-8
