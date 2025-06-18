# Используем официальный базовый образ
FROM ubuntu:22.04

# Устанавливаем bash
RUN apt update && apt install -y bash coreutils

# Копируем скрипт внутрь контейнера
COPY backup.sh /backup.sh

# Делаем скрипт исполняемым
RUN chmod +x /backup.sh

# Рабочая директория
WORKDIR /

# Команда по умолчанию
CMD ["/backup.sh"]
