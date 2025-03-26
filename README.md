# M169 Projekt

## Beschreibung
Dieses Repository enthält eine Beispielanwendung, die mit Docker containerisiert wurde. Diese Anleitung erklärt die Installation, das Erstellen des Docker-Images und das Starten des Containers.

## Voraussetzungen
- [Docker](https://www.docker.com/) installiert
- [Git](https://git-scm.com/) installiert

## Installation und Nutzung

### 1. Repository klonen
Klonen Sie das Repository auf Ihren lokalen Rechner:
```bash
git clone https://github.com/Yat008/M169.git
cd M169
```
Dieser Befehl lädt das Repository herunter und wechselt in das Projektverzeichnis.

### 2. Docker-Image erstellen
Erstellen Sie das Docker-Image basierend auf dem bereitgestellten `Dockerfile`:
```bash
docker build -t my-webserver .
```
- `docker build` startet den Build-Prozess.
- `-t my-webserver` gibt dem erstellten Image den Namen `my-webserver`.
- Der Punkt `.` gibt an, dass das `Dockerfile` im aktuellen Verzeichnis liegt.

### 3. Container starten
Starten Sie einen Container aus dem erstellten Image:
```bash
docker run -d -p 8080:80 \
    -v $(pwd)/website:/usr/share/nginx/html \
    -v $(pwd)/logs:/var/log/nginx \
    --name my-webserver my-webserver
```
- `docker run` erstellt und startet einen neuen Container.
- `-d` führt den Container im Hintergrund aus.
- `-p 8080:80` leitet Anfragen vom lokalen Port 8080 an den Container-Port 80 weiter.
- `-v $(pwd)/website:/usr/share/nginx/html` bindet den lokalen Ordner `website` an das Verzeichnis `/usr/share/nginx/html` im Container, um statische Webseiten-Dateien bereitzustellen.
- `-v $(pwd)/logs:/var/log/nginx` bindet den lokalen Ordner `logs` an das Verzeichnis `/var/log/nginx` im Container, um Logs auf dem Host-System zu speichern.
- `--name my-webserver` weist dem Container den Namen `my-webserver` zu.
- `my-webserver` ist das zuvor erstellte Docker-Image.

### 4. Container stoppen und entfernen
Um den laufenden Container zu stoppen:
```bash
docker stop my-webserver
```
Dieser Befehl stoppt den Container mit dem Namen `my-webserver`.

Um den Container zu entfernen:
```bash
docker rm my-webserver
```
Dies löscht den Container endgültig.

Falls Sie das Docker-Image ebenfalls entfernen möchten:
```bash
docker rmi my-webserver
```
Dies löscht das erstellte Docker-Image.

## Aufbau des Dockerfiles
Das `Dockerfile` beschreibt die Schritte zur Erstellung des Images:

```dockerfile
# Basis-Image
FROM nginx:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/share/nginx/html

# Webseite in das Image kopieren
COPY website/ /usr/share/nginx/html

# Port für den Container freigeben
EXPOSE 80

# Start des NGINX-Servers (Standard in nginx:latest)
CMD ["nginx", "-g", "daemon off;"]
```
### Erklärung der Befehle im Dockerfile
- `FROM nginx:latest` verwendet das neueste offizielle NGINX-Image als Basis.
- `WORKDIR /usr/share/nginx/html` legt das Verzeichnis für statische Webseiten-Dateien fest.
- `COPY website/ /usr/share/nginx/html` kopiert die Website-Dateien ins Image.
- `EXPOSE 80` gibt Port 80 für externe Anfragen frei.
- `CMD ["nginx", "-g", "daemon off;"]` startet den NGINX-Server im Vordergrund.

## Nützliche Docker-Befehle
**Liste aller laufenden Container anzeigen:**
```bash
docker ps
```
**Liste aller Container (inklusive gestoppter) anzeigen:**
```bash
docker ps -a
```
**Liste aller erstellten Images anzeigen:**
```bash
docker images
```
**Einen laufenden Container betreten (Shell öffnen):**
```bash
docker exec -it my-webserver /bin/sh
```
**Laufenden Container-Logs in Echtzeit anzeigen:**
```bash
docker logs -f my-webserver
```
**Alle Container auf einmal stoppen:**
```bash
docker stop $(docker ps -q)
```
**Alle Container auf einmal entfernen:**
```bash
docker rm $(docker ps -aq)
```
**Alle Docker-Images auf einmal löschen:**
```bash
docker rmi $(docker images -q)
```

## Fazit
Dieses Projekt bietet eine einfache und effektive Möglichkeit, eine statische Website mit Docker und NGINX bereitzustellen. Durch die Containerisierung wird eine konsistente Umgebung sichergestellt, die unabhängig vom Host-System funktioniert. Die Verwendung von Volume-Mounts ermöglicht eine flexible Verwaltung von Inhalten und Logs. Damit eignet sich dieses Setup ideal für Entwicklungs- und Testzwecke sowie für kleine Webanwendungen.

## Autor
[Yat008](https://github.com/Yat008)
