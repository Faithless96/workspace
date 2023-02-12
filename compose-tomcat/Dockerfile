FROM ubuntu:18.04
RUN apt update && apt install git wget maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN mv /boxfuse-sample-java-war-hello/target/hello-1.0.war /tmp/app/