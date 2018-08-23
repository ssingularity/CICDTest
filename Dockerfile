FROM registry.cn-hangzhou.aliyuncs.com/pipipan/maven
VOLUME /tmp
WORKDIR /app
RUN mkdir -p /app
RUN cd /app
ADD . /app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","package","-DskipTests"]
RUN chmod a+x /app/runboot.sh
EXPOSE 8080
CMD /app/runboot.sh