FROM ubuntu:18.04
RUN apt update && apt install git wget maven -y
RUN mkdir /tmp/app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN /boxfuse-sample-java-war-hello/target/hello-1.0.war
COPY --from=build /boxfuse-sample-java-war-hello/target/hello-1.0.war /$HOME