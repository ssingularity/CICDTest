FROM registry.cn-hangzhou.aliyuncs.com/acs/maven:3-jdk-8
VOLUME /tmp
WORKDIR /app
RUN mkdir -p /app
ADD ./pom.xml /app
RUN cd /app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","package","clean","--fail-never","-DskipTests"]
ADD . /app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","package","-DskipTests"]
RUN chmod a+x /app/runboot.sh
EXPOSE 8080
CMD /app/runboot.sh