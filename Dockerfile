FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
COPY oracle-instantclient11.1-basic-11.1.0.7.0-1.x86_64.rpm /usr/local/src

RUN set -x \
    && yum -y install gcc \
    && yum -y install httpd httpd-devel \
    && yum -y install libxml2 libxml2-devel \
    && yum -y install libjpeg libjpeg-devel \
    && yum -y install libpng libpng-devel \
    && yum -y install libXpm libXpm-devel \
    && yum -y install freetype freetype-devel \
    && yum -y install libc-client libc-client-devel \
    && yum -y install krb5-devel \
    && yum -y install openssl-devel \
    && yum -y install libmcrypt libmcrypt-devel \
    && yum -y install wget \
    && wget -P /usr/local/src --no-check-certificate http://museum.php.net/php5/php-5.3.1.tar.gz \
    && tar xzvf /usr/local/src/php-5.3.1.tar.gz -C /usr/local/src/
    