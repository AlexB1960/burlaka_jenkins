FROM usebruno/cli:latest

USER root

WORKDIR /bruno
COPY . .

ENTRYPOINT ["sh", "-c", "docker run --rm -v $(pwd):/bruno -w /bruno usebruno/cli:latest run"]