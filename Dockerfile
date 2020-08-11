FROM python:3.7.8-alpine

LABEL maintainer="JCD from ENI"

ENV PAGER less
CMD ["ash"]

RUN \
apk update && \
apk add gcc libc-dev libffi-dev libressl-dev git make mandoc man-pages mandoc-apropos less less-doc  && \
pip install --upgrade pip && \
pip install packaging docutils straight.plugin && \
wget https://releases.ansible.com/ansible/ansible-latest.tar.gz && \
tar xzf ansible-latest.tar.gz && \
cd $(ls|grep '^ansible-\d.*') && \
make install && \
make docs && \
cp docs/man/man1/* /usr/share/man/man1/ && \
mkdir /etc/ansible && \
cp examples/ansible.cfg examples/hosts /etc/ansible/ && \
make clean && \
cd / && \
rm -fR /$(ls|grep '^ansible-\d.*') && \
rm -fR /var/cache/apk/* && \
rm ansible-latest.tar.gz
