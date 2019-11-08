FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
COPY ./oracle/ /usr/local/src/

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
    && yum -y install unzip \
    && yum -y install libaio \
    && yum -y install make \
    && yum -y install --nogpgcheck /usr/local/src/oracle-instantclient11.1-*-11.1.0.7.0-1.x86_64.rpm \
    && echo "/usr/lib/oracle/11.1/client64/lib" >> /etc/ld.so.conf \
    && ldconfig \
    && wget -P /usr/local/src --no-check-certificate http://museum.php.net/php5/php-5.3.1.tar.gz \
    && tar xzvf /usr/local/src/php-5.3.1.tar.gz -C /usr/local/src/ \
    && cd /usr/local/src/php-5.3.1 \
    && ./configure --enable-mbstring --enable-debug --enable-inline-optimization --enable-magic-quotes --enable-safe-mode --enable-sigchild --enable-ctype --without-mysql --without-pear --with-apxs2=/usr/sbin/apxs --with-oci8=instantclient,/usr/lib/oracle/11.1/client64/lib --with-gd --with-jpeg-dir --with-png-dir --with-zlib-dir=/usr/lib64 --with-freetype-dir --enable-gd-native-ttf --enable-gd-jis-conv --enable-mbregex --with-iconv --with-mcrypt --enable-soap --with-ldap-sasl --enable-ftp --with-xpm-dir --with-imap --with-imap-ssl --with-kerberos --with-libdir=lib64 \
    && make \
    && make install
    
COPY ./bashProfile/ /root/
COPY ./phpini/ /usr/local/lib/
COPY ./php53conf/ /etc/httpd/conf.d/
COPY ./apache/ /etc/httpd/conf/

RUN set -x \
    && source /root/.bash_profile \
    && chkconfig httpd on \
    && service httpd start

