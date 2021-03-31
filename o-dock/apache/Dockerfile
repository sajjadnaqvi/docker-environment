ARG HTTPD_VERSION
ARG LINUX_DISTRO
FROM httpd:${HTTPD_VERSION}-${LINUX_DISTRO}

RUN apk update
RUN apk upgrade
RUN rm -rf /var/lib/apt/lists/*

ARG APACHE_CONFIG_PATH
ENV APACHE_CONFIG_PATH ${APACHE_CONFIG_PATH}

# Copy apache vhost file to proxy php requests to php-fpm container
COPY ./apache.conf ${APACHE_CONFIG_PATH}/apache.conf


RUN echo "Include ${APACHE_CONFIG_PATH}/apache.conf" \
      >> ${APACHE_CONFIG_PATH}/httpd.conf
