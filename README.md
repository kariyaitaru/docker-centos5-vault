# centos5-vault

On March 31, 2017, support of CentOS 5 has ended.
And therefore, we cannot perform `yum` on CentOS 5 official images because yum repositories for CentOS 5 is deleted.
This image rewrites yum repository urls in /etc/yum.repos.d to vault.centos.org.
You can use this image as drop-in replacement of official `centos:5` (`centos:5.11`).

## Forked By kariyaitaru

|OS、ミドルウエア|バージョン|
|---|---|
|CentOS|5.11|
|Apache|2.2.3|
|PHP|5.3.1|
|OracleClient|11.1.0.7|
