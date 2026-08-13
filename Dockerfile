FROM node:18-alpine

# 1. Ставим curl и bash (нужны для скрипта установки)
RUN apk add --no-cache curl bash

# 2. Устанавливаем Bruno CLI
# Скрипт сам скачает бинарь и положит его в /usr/local/bin (или аналогичную системную папку)
RUN curl -fsSL https://raw.githubusercontent.com/usebruno/bruno-cli/main/install.sh | sh

# 3. КРИТИЧЕСКИ ВАЖНО: Добавляем папку с bru в PATH навсегда для этого образа
# Обычно bru лежит в /usr/local/bin. Если нет - проверь логи сборки.
ENV PATH="/usr/local/bin:${PATH}"

WORKDIR /workspace

# Теперь команда "bru" будет видна в любой новой оболочке
CMD ["bru", "run", "collection.yml"]