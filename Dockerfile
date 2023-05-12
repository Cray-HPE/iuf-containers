FROM opensuse/leap:15.3
COPY zypper.sh /
RUN --mount=type=secret,id=SLES_REPO_USERNAME --mount=type=secret,id=SLES_REPO_PASSWORD ./zypper.sh && rm /zypper.sh
COPY ./bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENV  LC_ALL=C.UTF-8, LANG=C.UTF-8
