FROM python:3

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    wget \
    gnupg

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list


RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    git \
    libsasl2-modules \
    mariadb-client \
    mongodb-org-tools \
    mongodb-org-shell

WORKDIR /usr/bin/frida

RUN cd /usr/bin/frida

# The latest version 21.1 has problems
RUN python3 -m pip install pip==21.0.1

RUN git clone -b develop https://github.com/RiccardoCurcio/frida .
RUN mkdir -p /usr/bin/frida/logs
RUN mkdir -p /usr/bin/frida/backups