FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get install -y maven && \
    apt install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /tmp/

FROM tomcat:9.0-alpine
EXPOSE 8080
RUN cp /tmp/hello-1.0.war /var/lib/tomcat9/webapps/