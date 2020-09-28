FROM alpine

ENV PORT 8080
ENV DEBUG_PORT 8000

ENV JPDA_ADDRESS *:$DEBUG_PORT
ENV JPDA_TRANSPORT dt_socket
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.38

WORKDIR $CATALINA_HOME

RUN apk add -q openjdk11 && \
    wget -qO tomcat.tar.gz https://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar -xf tomcat.tar.gz --strip-components=1 && \
    rm bin/*.bat tomcat.tar.gz && \
    mv webapps webapps.dist && \
    mkdir webapps && \
    chmod -R +rX . && \
    chmod 777 logs temp work

EXPOSE $PORT $DEBUG_PORT
ENTRYPOINT ["catalina.sh", "jpda", "run"]