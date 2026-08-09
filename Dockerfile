FROM eclipse-temurin:21-jdk

USER root

RUN apt install docker.io -y

FROM usebruno/cli:latest

WORKDIR /bruno
COPY . .

ENTRYPOINT ["sh", "-c", "docker run --rm -v $(pwd):/bruno -w /bruno usebruno/cli:latest run"]