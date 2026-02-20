# GUÍA RÁPIDA - Deployment en Render

## ✅ Lo que ya he hecho:

1. ✅ Creado Dockerfile con multi-stage build
2. ✅ Creado .dockerignore
3. ✅ Creado docker-compose.yml para testing
4. ✅ Subido a GitHub (rama main)
5. ✅ Creados scripts y guías de deployment

---

## 📋 Próximos Pasos - MANUAL (Requiere Docker instalado)

### Opción A: Si tienes Docker instalado

**1. Ejecutar el script de deployment:**
```powershell
# PowerShell como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
./deploy.ps1
```

**2. El script te pedirá:**
- Tu usuario de Docker Hub
- Tu contraseña de Docker Hub

**3. Luego hará automáticamente:**
- Construir la imagen
- Etiquetarla
- Subirla a Docker Hub

---

### Opción B: Manual (Paso a Paso)

**1. Instalar Docker Desktop:**
- Descarga: https://www.docker.com/products/docker-desktop
- Instala y reinicia

**2. Autenticarse en Docker Hub:**
```powershell
docker login
```

**3. Construir imagen:**
```powershell
cd c:\Users\Alejandro\Desktop\App-SpringBoot
docker build -t task-manager:latest .
```

**4. Etiquetar imagen:**
```powershell
docker tag task-manager:latest tu-usuario/task-manager:latest
```

**5. Subir a Docker Hub:**
```powershell
docker push tu-usuario/task-manager:latest
```

---

## 🚀 Deployment en Render

### Paso 1: Conectar GitHub a Render

1. Ve a https://dashboard.render.com
2. Haz clic en "New" → "Web Service"
3. Selecciona "Connect a repository"
4. Autoriza GitHub
5. Busca y selecciona "app-springboot"

### Paso 2: Configurar el Servicio

**Name:** task-manager

**Build & Deploy Settings:**
- **Runtime:** Docker
- **Region:** Frankfurt (EU) - Más cercano a España
- **Instance Type:** Free

**Environment Variables:**
```
PORT=8080
JAVA_TOOL_OPTIONS=-Xmx512m
```

**Advanced:**
- Health Check Path: `/tasks/health`
- Auto-deploy: ON

### Paso 3: Deploy
- Haz clic en "Create Web Service"
- Espera 2-5 minutos
- Tu app estará en: `https://task-manager.onrender.com`

---

## 🌐 Dominio Personalizado

### Configurar en Render:

1. Ve a tu servicio → **Settings**
2. Desplázate a **Custom Domain**
3. Ingresa tu dominio (ej: `miapp.com`)
4. Render mostrará un CNAME

### Configurar DNS en tu proveedor:

**Ejemplo con Namecheap, GoDaddy, etc:**

| Campo | Valor |
|-------|-------|
| Type | CNAME |
| Host | www |
| Value | task-manager.onrender.com |

---

## 📊 URLs Finales

- **URL de Render:** `https://task-manager.onrender.com`
- **Health Check:** `https://task-manager.onrender.com/tasks/health`
- **API Tasks:** `https://task-manager.onrender.com/tasks`
- **Aplicación Web:** `https://task-manager.onrender.com/`
- **Dominio Custom:** `https://miapp.com` (después de DNS)

---

## 📱 Testing Local (con Docker)

```powershell
# Construir y ejecutar con docker-compose:
docker-compose up

# La app estará en: http://localhost:8080

# Parar los contenedores:
docker-compose down
```

---

## 🔍 Solución de Problemas

### Error: "docker: The term 'docker' is not recognized"
→ Docker no está instalado. Instala Docker Desktop.

### Error: "authentication failed"
→ Verifica tu usuario y contraseña en Docker Hub.

### Render: "Build failed"
→ Revisa los logs en el dashboard de Render.

### Dominio no resuelve
→ Espera 24-48 horas para propagación DNS.

---

## 📚 Archivos Creados

```
App-SpringBoot/
├── Dockerfile              ← Configuración de la imagen
├── docker-compose.yml      ← Para testing local
├── .dockerignore          ← Archivos a excluir
├── deploy.ps1             ← Script automation
├── render.yaml            ← Config de Render (opcional)
├── .env.example           ← Variables de entorno
└── DEPLOYMENT.md          ← Guía completa
```

---

## ✨ Ventajas del Setup

- ✅ Multi-stage Docker build (imagen optimizada ~200MB)
- ✅ Auto-deploy desde GitHub
- ✅ Health checks en Render
- ✅ Escalable a instancias pagadas
- ✅ Dominio personalizado con SSL gratis
- ✅ Logs disponibles 24/7

---

**¿Preguntas? Consulta DEPLOYMENT.md para más detalles.**
