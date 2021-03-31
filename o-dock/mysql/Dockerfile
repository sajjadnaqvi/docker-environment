ARG MYSQL_VERSION
FROM mysql:${MYSQL_VERSION}

ENV DEBIAN_FRONTEND noninteractive

# Software's Installation
RUN apt-get update && \
    # apt-get install -y apt-transport-https && \
    # apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
    vim -yqq


# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog


ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && chown -R mysql:mysql /var/lib/mysql/
# RUN mkdir /var/lib/mysql-files && chown -R mysql:mysql /var/lib/mysql-files/ && chmod 700 /var/lib/mysql-files/


COPY ./my.cnf /etc/mysql/my.cnf

# CMD ["mysqld"]

EXPOSE 3306
