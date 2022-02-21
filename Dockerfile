FROM ubuntu:16.04 AS build
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get install -y maven && \
    apt install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello/
RUN mvn package && ls

FROM tomcat:9.0-alpine
COPY --from=build /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
WORKDIR /var/lib/tomcat9/webapps/
RUN ls
EXPOSE 8080 