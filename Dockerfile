FROM ubuntu:16.04 AS build
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get install -y maven && \
    apt install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package

FROM tomcat:9.0-alpine
COPY /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080 