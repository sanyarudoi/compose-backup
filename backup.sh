#!/bin/bash

LOGS_DIR=${LOGS_DIR:-/data}
BACKUP_PREFIX=${BACKUP_PREFIX:-backup_}
LOG_FILE=${LOG_FILE:-backup.log}

TIMESTAMP=$(date +"%Y%m%d_%H%M")
BACKUP_DIR="${LOGS_DIR}/${BACKUP_PREFIX}${TIMESTAMP}"
mkdir -p "$BACKUP_DIR"

COUNT=$(find . -maxdepth 1 -name "*.txt" | wc -l)
cp *.txt "$BACKUP_DIR" 2>/dev/null

echo "[$(date '+%Y-%m-%d %H:%M')] Скопировано $COUNT файлов в ${BACKUP_PREFIX}${TIMESTAMP}" >> "${LOGS_DIR}/${LOG_FILE}"