FROM node:18-alpine

# В alpine нет curl по умолчанию — ставим его
RUN apk add --no-cache curl bash

# Устанавливаем Bruno CLI через официальный скрипт
# Скрипт сам поставит bru в /usr/local/bin (или аналог), что будет в PATH
RUN curl -fsSL https://raw.githubusercontent.com/usebruno/bruno-cli/main/install.sh | sh

WORKDIR /workspace

# По умолчанию ничего не запускаем — мы будем передавать команду в docker run
CMD ["bru", "run", "collection.yml"]
