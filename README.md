# Mini-Project

This project sets up an **NGINX web server** inside a **Docker container** to serve a simple static website. The setup includes mounting local directories for website files and logs.

## 📌 Requirements
- Docker installed
- (Optional) Docker Compose installed
- Git (for version control and pushing to GitHub/GitLab)

---

## 🚀 Setup Instructions

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-username/mini-project.git
cd mini-project
```

### 2️⃣ Project Structure
Ensure your directory has the following structure:
```
mini-project/
│── Dockerfile
│── website/
│   ├── index.html
│   ├── styles.css
│── logs/   (this will store logs)
│── README.md
```

---

## 📦 Build and Run

### 🏗️ Using Docker
#### 1. Build the Docker image:
```sh
docker build -t my-webserver .
```

#### 2. Run the container:
```sh
docker run -d -p 8080:80 \
    -v $(pwd)/website:/usr/share/nginx/html \
    -v $(pwd)/logs:/var/log/nginx \
    --name my-webserver my-webserver
```

#### 3. Open in browser:
```
http://localhost:8080
```

#### 4. View logs:
```sh
docker logs my-webserver
```

#### 5. Stop the container:
```sh
docker stop my-webserver
```

#### 6. Remove the container (optional):
```sh
docker rm my-webserver
```

---

### Stop the container:
```sh
docker-compose down
```

---

## 📝 Dockerfile (Web Server Setup)

```dockerfile
# Use the official NGINX base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy website files to the container
COPY ./website/ /usr/share/nginx/html/

# Expose port 8080
EXPOSE 8080

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
```

---

## 🔄 Push to GitHub/GitLab

```sh
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/your-username/mini-project.git
git push -u origin main
```

Share the repository URL with your instructor.

---

## ✅ Conclusion
This setup provides a lightweight **NGINX web server** inside a **Docker container**, making it easy to host a static website. Happy coding! 🚀

