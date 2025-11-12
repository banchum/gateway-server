FROM eclipse-temurin:21-jdk
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

ENV DB_DDL_AUTO=create

ENV HOSTNAME=localhost
ENV EUREAKA_URL=http://localhost:3150/eureka/

ENTRYPOINT ["java", "-DEUREKA_INSTANCE_HOSTNAME=${HOSTNAME}","-DEUREKA_CLIENT_SERVICEURL_DEFAULTZONE=${EUREAKA_URL}","-jar", "app.jar"]

EXPOSE 3000