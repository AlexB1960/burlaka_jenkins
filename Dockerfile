FROM node:18

# В обычном node (не alpine) уже есть curl и bash
# Скачиваем bru напрямую
RUN curl -fsSL https://raw.githubusercontent.com/usebruno/bruno-cli/main/install.sh | sh

# Добавляем в PATH (на всякий случай, хотя скрипт должен был это сделать)
ENV PATH="/usr/local/bin:${PATH}"

WORKDIR /workspace