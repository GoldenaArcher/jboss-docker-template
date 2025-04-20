FROM openjdk:8-jdk

WORKDIR /opt/wildfly

COPY wildfly-8.2.0.Final.zip ./

RUN apt-get update && apt-get install -y unzip && \
    unzip wildfly-8.2.0.Final.zip && \
    rm wildfly-8.2.0.Final.zip

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:8787"

EXPOSE 8080 9990 8787

CMD ["./wildfly-8.2.0.Final/bin/standalone.sh", "-b", "0.0.0.0"]
