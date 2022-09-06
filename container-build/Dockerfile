# Use the httpd-parent image as base
FROM quay.io/mcheung/mark-http-parent-test

EXPOSE 8080
LABEL io.openshift.expose-services="8080:http"

RUN sed -i "s/Listen 80/ Listen 8080/g" /etc/httpd/conf/httpd.conf && 
    chgrp -R 0 /var/run/httpd /var/log/httpd
    chmod -R g=u  /var/run/httpd /var/log/httpd

USER 1001 
