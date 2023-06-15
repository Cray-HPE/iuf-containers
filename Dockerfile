FROM opensuse/leap:15.3
COPY ./bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENV  LC_ALL=C.UTF-8, LANG=C.UTF-8
