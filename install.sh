#!/bin/bash

set -e  # Остановить скрипт при ошибке

echo "[+] Добавление GPG ключа репозитория Caddy..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | \
  sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg -y

echo "[+] Добавление репозитория Caddy в sources.list..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | \
  sudo tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null

echo "[+] Обновление списков пакетов..."
sudo apt update

echo "[+] Установка Caddy..."
sudo apt install -y caddy

echo "[✓] Установка завершена."
