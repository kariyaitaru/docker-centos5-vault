# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export ORACLE_BASE=/oracle/app
export ORACLE_HOME=${ORACLE_BASE}/product/11.1.0/db_1
export NLS_LANG=JAPANESE_JAPAN.UTF8
export JAVA_HOME=/usr/lib/jvm/java-1.5.0-ibm-1.5.0.7.x86_64
export CLASSPATH=.
export CATALINA_OPTS='-Xms128M -Xmx256M'
export PATH=.:$JAVA_HOME/bin:$PATH:$HOME:$ORACLE_HOME/bin
export LD_LIBRARY_PATH=/usr/lib/oracle/11.1/client64/lib
unset USERNAME

export PATH
