FROM registry.cn-hangzhou.aliyuncs.com/pipipan/maven
VOLUME /tmp
WORKDIR /app
RUN mkdir -p /app
ADD . /app
RUN cd /app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","package","-DskipTests"]
EXPOSE 8080
ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/urandom -jar /app/target/cicdtest-0.0.1-SNAPSHOT.jar" ]

