FROM centos:7

ENV http_proxy http://103.27.171.34:9480/
ENV https_proxy http://103.27.171.34:9480/

RUN echo proxy=http://103.27.171.34:9480/ >> /etc/yum.conf

ADD install.sh /tmp/install.sh

RUN /tmp/install.sh
