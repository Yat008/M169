# 📦 WordPress + MySQL Setup mit Docker Compose  
## 🔐 Passwörter & Secrets aus `.env`-Datei

Dieses Projekt setzt eine lokale WordPress-Instanz mit MySQL-Datenbank auf, basierend auf Docker Compose. Alle Passwörter und sensiblen Daten werden **nicht in der YAML-Datei**, sondern sicher über eine `.env`-Datei eingebunden.

---

## 🧾 Inhalt

- `docker-compose.yaml`: Konfigurationsdatei für die Dienste
- `.env`: Datei mit Zugangsdaten (nicht ins Repo hochladen!)
- Schritt-für-Schritt-Anleitung zum Starten, Stoppen und Löschen
- Ausführliche Erklärung der Konfiguration
- Sicherheitshinweise
- Projektstruktur

---

## 📁 docker-compose.yaml

```yaml
version: '3.8'

services:
  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    restart: always
    ports:
      - "8000:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: ${MYSQL_USER}
      WORDPRESS_DB_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - wp_data:/var/www/html

volumes:
  db_data:
  wp_data:
