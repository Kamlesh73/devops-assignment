FROM azul/zulu-openjdk-alpine:17-jre
WORKDIR /app

RUN addgroup -S appgroup && adduser -S -u 10001 -G appgroup appuser

ARG JAR_FILE=target/hello-world-1.0.0.jar
COPY ${JAR_FILE} app.jar

USER appuser
EXPOSE 8080

ENTRYPOINT ["java"]
CMD ["-jar", "/app/app.jar"]
