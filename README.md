# Mini Web Server Project

Dieses Projekt richtet einen **NGINX-Webserver** in einem **Docker-Container** ein, um eine einfache statische Website bereitzustellen. 

## 📌 Voraussetzungen
- Docker installiert
- Git (für Versionskontrolle und Upload zu GitHub/GitLab)

---

## 🚀 Setup-Anleitung

### 1️⃣ Repository klonen
```sh
git clone https://github.com/Yat008/M169/
cd M169
```

### 2️⃣ Projektstruktur
Stellen Sie sicher, dass Ihr Verzeichnis wie folgt aussieht:
```
M169/
│── Dockerfile
│── website/
│   ├── index.html
│   ├── styles.css
│── logs/   (dieses Verzeichnis speichert Logs)
│── README.md
```

👉 **Hinweis:** Git erlaubt keine leeren Ordner. Um `logs/` im Repository zu behalten, fügen Sie eine leere `.gitkeep`-Datei hinzu:
```sh
touch logs/.gitkeep
```
Dann das Verzeichnis committen:
```sh
git add logs/.gitkeep
```

---

## 📦 Docker-Build und Start

### 🏗️ Container erstellen und starten
#### 1. Docker-Image bauen:
```sh
docker build -t my-webserver .
```

#### 2. Container starten:
```sh
docker run -d -p 8080:80 \
    -v $(pwd)/website:/usr/share/nginx/html \
    -v $(pwd)/logs:/var/log/nginx \
    --name my-webserver my-webserver
```

#### 3. Website im Browser öffnen:
```
http://localhost:8080
```

#### 4. Logs anzeigen:
```sh
docker logs my-webserver
```

#### 5. Container stoppen:
```sh
docker stop my-webserver
```

#### 6. Container entfernen (optional):
```sh
docker rm my-webserver
```

---

## 📝 Dockerfile (Webserver-Setup)

```dockerfile
# Offizielles NGINX-Image verwenden
FROM nginx:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/share/nginx/html

# Website-Dateien in den Container kopieren
COPY ./website/ /usr/share/nginx/html/

# Port 8080 freigeben
EXPOSE 8080

# NGINX starten
CMD ["nginx", "-g", "daemon off;"]
```

---

## 🌐 Beispiel `index.html`
Speichern Sie folgende Datei unter `website/index.html`:

```html
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mein Mini-Projekt</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Willkommen auf meinem Webserver!</h1>
    <p>Diese einfache Webseite läuft in einem Docker-Container.</p>
</body>
</html>
```

---

## 🔄 Repository zu GitHub/GitLab hochladen

```sh
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/your-username/mini-project.git
git push -u origin main
```

👉 **Leeren Ordner (`logs/`) beibehalten:**
Falls Sie einen leeren Ordner zu GitHub hochladen möchten, fügen Sie eine `.gitkeep`-Datei hinzu:
```sh
touch logs/.gitkeep
```
Dann committen:
```sh
git add logs/.gitkeep
```

---

## ✅ Fazit
Dieses Setup stellt eine **NGINX-Webserver-Umgebung** innerhalb eines **Docker-Containers** bereit, um eine statische Webseite zu hosten. Viel Erfolg! 🚀

