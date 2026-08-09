FROM eclipse-temurin:21-jdk

USER root

RUN apt update -y && apt install -y docker.io ansible
RUN ansible-galaxy collection install community.docker

FROM usebruno/cli:latest

WORKDIR /bruno
COPY . .

ENTRYPOINT ["sh", "-c", "docker run --rm -v $(pwd):/bruno -w /bruno usebruno/cli:latest run"]