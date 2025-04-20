FROM openjdk:8-jdk

WORKDIR /opt/jboss

COPY jboss-eap-6.4.0.zip ./

RUN apt-get update && apt-get install -y unzip && \
    unzip jboss-eap-6.4.0.zip && \
    rm jboss-eap-6.4.0.zip

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8787"

EXPOSE 8080 9990 8787

CMD ["./jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0"]
