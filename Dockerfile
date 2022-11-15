FROM opensuse/leap:15.3
ADD https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp3/craycli/x86_64/craycli-0.64.0-1.x86_64.rpm craycli-0.64.0-1.x86_64.rpm
ADD https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp2/loftsman-rpm/x86_64/loftsman-1.2.0-1.x86_64.rpm loftsman-1.2.0-1.x86_64.rpm
ADD https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp3/manifestgen/x86_64/manifestgen-1.3.7-1.x86_64.rpm manifestgen-1.3.7-1.x86_64.rpm
RUN rpm -i craycli-0.64.0-1.x86_64.rpm && rpm -i loftsman-1.2.0-1.x86_64.rpm && rpm -i manifestgen-1.3.7-1.x86_64.rpm && zypper --non-interactive install git
ENV  LC_ALL=C.UTF-8, LANG=C.UTF-8
