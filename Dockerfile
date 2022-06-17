FROM gradle:jdk11-alpine
RUN export PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CMD ["gradle build sonarqube"]
