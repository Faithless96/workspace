FROM ubuntu:22.04
RUN apt update
RUN apt install maven default-jdk git tomcat9 -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cd target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080

