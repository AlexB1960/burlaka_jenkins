FROM node:18

# В node:18 уже есть curl и bash, ничего дополнительно ставить не надо

# Устанавливаем Bruno CLI через официальный скрипт
# Важно: скрипт сам скачает бинарь и положит его в /usr/local/bin
RUN curl -fsSL https://raw.githubusercontent.com/usebruno/bruno-cli/main/install.sh | sh

# Гарантированно добавляем /usr/local/bin в PATH (на случай, если скрипт этого не сделал)
ENV PATH="/usr/local/bin:${PATH}"

WORKDIR /workspace

# По умолчанию ничего не делаем — команда будет передаваться из Jenkins
CMD ["bru", "run", "collection.yml"]