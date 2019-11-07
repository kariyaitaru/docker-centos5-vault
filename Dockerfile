FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
COPY ./oracle/ /oracle/app/

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
    && : "環境変数の設定" \
    && export ORACLE_BASE=/oracle/app \
    && export ORACLE_HOME=${ORACLE_BASE}/product/11.1.0/db_1 \
    && export NLS_LANG=JAPANESE_JAPAN.AL32UTF8 \
    && export JAVA_HOME=/usr/lib/jvm/java-1.5.0-ibm-1.5.0.7.x86_64 \
    && export CLASSPATH=. \
    && export CATALINA_OPTS='-Xms128M -Xmx256M' \
    && export PATH=.:$JAVA_HOME/bin:$PATH:$HOME:$ORACLE_HOME/bin \
    && unset USERNAME \
    && : "コメント" \
    && : "コメント" \
    && : "コメント" \
    && : "2.4.1 Oracleインベントリ・グループの作成" \
    && /usr/sbin/groupadd oinstall \
    && /usr/sbin/groupadd dba \
    && : "2.4.2 Oracleソフトウェア所有者ユーザーの作成" \
    && /usr/sbin/useradd -g oinstall -G dba oracle \
    && : "コメント" \
    && chown -R oracle:oinstall $ORACLE_BASE \
    && chmod -R 775 $ORACLE_BASE \
    && : "コメント" \
    && : "コメント" \
    && : "コメント" \
    && wget -P /usr/local/src --no-check-certificate http://museum.php.net/php5/php-5.3.1.tar.gz \
    && tar xzvf /usr/local/src/php-5.3.1.tar.gz -C /usr/local/src/ \
    && : "コメント" \
    && : "コメント" \
    && : "コメント"
    
    
    