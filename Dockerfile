FROM ubuntu:18.04
RUN apt update
EXPOSE 8080
RUN apt install maven default-jdk git tomcat9 -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR  /boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps
CMD /bin/bash


