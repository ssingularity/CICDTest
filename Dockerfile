FROM maven:3.3-jdk-8
VOLUME /tmp
RUN mkdir /app
ADD ./ /app
RUN cd /app && mvn clean package -DskipTests
RUN chomd a+x /app/runboot.sh
WORKDIR /app
EXPOSE 8080
CMD /app/runboot.sh