FROM usebruno/cli:latest

USER root

RUN apt install docker.io -y

WORKDIR /bruno
COPY . .

ENTRYPOINT ["sh", "-c", "docker run --rm -v $(pwd):/bruno -w /bruno usebruno/cli:latest run"]