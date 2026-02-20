# Guía de Deployment - Task Manager

## Prerequisitos

1. **Cuenta en Docker Hub**: https://hub.docker.com
2. **Cuenta en Render**: https://render.com
3. **Docker instalado localmente** (opcional, para testing local)

---

## Paso 1: Construir la imagen Docker localmente (Opcional)

```powershell
cd c:\Users\Alejandro\Desktop\App-SpringBoot

# Construir la imagen
docker build -t task-manager:latest .

# Probar localmente
docker run -p 8080:8080 task-manager:latest
```

---

## Paso 2: Subir la imagen a Docker Hub

### 2.1 Autenticarse en Docker Hub
```powershell
docker login
# Ingresar usuario y contraseña de Docker Hub
```

### 2.2 Etiquetar la imagen
```powershell
# Reemplazar "tu-usuario" con tu usuario de Docker Hub
docker tag task-manager:latest tu-usuario/task-manager:latest
```

### 2.3 Push de la imagen
```powershell
docker push tu-usuario/task-manager:latest
```

---

## Paso 3: Desplegar en Render

### 3.1 Crear nuevo Web Service en Render
1. Accede a https://dashboard.render.com
2. Haz clic en "New" → "Web Service"
3. Selecciona "Deploy an existing image"

### 3.2 Configurar el servicio
- **Image URL**: `docker.io/tu-usuario/task-manager:latest`
- **Name**: `task-manager`
- **Region**: Frankfurt (EU)
- **Plan**: Free
- **Environment Variables**:
  - `PORT=8080`
  - `JAVA_TOOL_OPTIONS=-Xmx512m`

### 3.3 Esperar el despliegue
El proceso de despliegue toma entre 2-5 minutos.

---

## Paso 4: Asignar Dominio Personalizado

### 4.1 En el dashboard de Render
1. Ve a tu servicio "task-manager"
2. Haz clic en la pestaña "Settings"
3. Desplázate hasta "Custom Domain"
4. Ingresa tu dominio (ej: `miapp.com`)

### 4.2 Configurar DNS
Tu proveedor de dominio debe apuntar a:
- **Type**: CNAME
- **Name**: `www` (o el subdominio deseado)
- **Value**: El dominio asignado por Render (ej: `task-manager.onrender.com`)

---

## URLs Resultantes

- **Render URL**: `https://task-manager.onrender.com`
- **Dominio Personalizado**: `https://miapp.com` (después de configurar DNS)
- **API Health Check**: `https://task-manager.onrender.com/tasks/health`
- **Aplicación Web**: `https://task-manager.onrender.com/`

---

## Comandos Útiles

### Ver logs en Render
```
Desde el dashboard → Logs
```

### Redeploy manual
```
Dashboard → Manual Deploy → Deploy latest commit
```

### Variables de entorno en Render
```
Environment → Environment Variables
```

---

## Solución de Problemas

### "Image not found"
- Verifica que el nombre de usuario de Docker Hub sea correcto
- Asegúrate de haber hecho push de la imagen

### "Port 8080 not accessible"
- Revisa los logs en Render
- Verifica que la aplicación esté escuchando en puerto 8080

### Dominio no resuelve
- Espera hasta 48 horas para que los DNS se propagues
- Verifica la configuración CNAME en tu proveedor

---

## Dockerfile Explicado

El Dockerfile usa una estrategia de **multi-stage build**:
- **Etapa 1 (builder)**: Compila la aplicación con Maven
- **Etapa 2 (runtime)**: Corre solo el JAR compilado en una imagen más pequeña

Ventajas:
- Imagen final más pequeña (~200MB vs ~500MB)
- Mejor seguridad (sin herramientas de build)
- Startup más rápido
