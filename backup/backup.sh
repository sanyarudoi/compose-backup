#!/bin/bash

# Получить дату и имя папки
DATE=$(date +"%Y%m%d_%H%M")
DIR="backup_$DATE"

# Создать папку
mkdir "$DIR"

# Скопировать .txt файлы
cp *.txt "$DIR" 2>/dev/null

# Посчитать количество скопированных файлов
COUNT=$(ls "$DIR"/*.txt 2>/dev/null | wc -l)

if [ $COUNT -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M")] Нет файлов для резервного копирования" >> backup.log
    echo "Нет файлов .txt для копирования."
    rmdir "$DIR"  # Чистим за собой
    exit 0
fi

# Записать лог
echo "[$(date +"%Y-%m-%d %H:%M")] Скопировано $COUNT файлов в $DIR" >> backup.log

# Вывести результат
echo "Готово! Скопировано $COUNT файлов."
