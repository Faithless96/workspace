FROM ubuntu:18.04
RUN apt update
RUN apt install maven default-jdk git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package
RUN cd target
RUN cp hello-1.0.war /var/lib/lomcat9/webapps
EXPOSE 8080

