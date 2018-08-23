FROM registry.cn-hangzhou.aliyuncs.com/pipipan/maven AS build-env
VOLUME /tmp
WORKDIR /app
RUN mkdir -p /app
ADD . /app
RUN cd /app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","package","-DskipTests"]

FROM openjdk:8-jre-alpine
COPY --from=build-env /app/target/cicdtest-0.0.1-SNAPSHOT.jar /app.jar
ENV JAVA_OPTS=""
ENV SERVER_PORT 8080
EXPOSE ${SERVER_PORT}
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/urandom -jar /app.jar" ]
