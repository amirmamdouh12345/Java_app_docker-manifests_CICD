#FROM eclipse-temurin:8-jdk-ubi9-minimal
FROM openjdk:17-jdk-slim

#RUN  echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.18/main" > /etc/apk/repositories && \
#    echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.18/community" >> /etc/apk/repositories  && \
#    apk update 

#RUN apt update -y && apt install maven openjdk-17-jdk -y

WORKDIR /app


COPY ./web-app/build/libs/demo-0.0.1-SNAPSHOT.jar ./

#RUN mvn clean package



CMD ["java","-jar","demo-0.0.1-SNAPSHOT.jar" ]

