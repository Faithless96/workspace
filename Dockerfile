FROM ubuntu:18.04
RUN apt update
RUN apt install maven default-jdk git curl wget -y
ENV TOMCAT_VERSION 9.0.71
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \tar xzvf /tmp/tomcat.tgz -C /opt && mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
RUN rm /tmp/tomcat.tgz && rm -rf /opt/tomcat/webapps/examples && rm -rf /opt/tomcat/webapps/docs && rm -rf /opt/tomcat/webapps/ROOT
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin
WORKDIR /opt/tomcat
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR  /boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /opt/tomcat/webapps
EXPOSE 8080
CMD /opt/tomcat/bin/run.sh