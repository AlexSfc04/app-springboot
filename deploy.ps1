# Script de Deployment para Docker y Render
# Ejecutar desde PowerShell como Administrador

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Task Manager - Docker & Render Deploy" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si Docker está instalado
Write-Host "1. Verificando Docker..." -ForegroundColor Yellow
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker no está instalado." -ForegroundColor Red
    Write-Host "Descarga Docker Desktop desde: https://www.docker.com/products/docker-desktop" -ForegroundColor Cyan
    Write-Host "Luego ejecuta este script nuevamente." -ForegroundColor Cyan
    exit 1
}
Write-Host "✓ Docker está instalado" -ForegroundColor Green
Write-Host ""

# Obtener información del usuario
Write-Host "2. Configurar credenciales..." -ForegroundColor Yellow
$dockerUser = Read-Host "   Ingresa tu usuario de Docker Hub"
if ([string]::IsNullOrEmpty($dockerUser)) {
    Write-Host "Usuario requerido" -ForegroundColor Red
    exit 1
}

# Autenticarse en Docker Hub
Write-Host ""
Write-Host "3. Autenticarse en Docker Hub..." -ForegroundColor Yellow
docker login --username $dockerUser
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error en autenticación" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Autenticación exitosa" -ForegroundColor Green
Write-Host ""

# Construir la imagen
Write-Host "4. Construyendo imagen Docker..." -ForegroundColor Yellow
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $projectPath
docker build -t task-manager:latest .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error construyendo imagen" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Imagen construida exitosamente" -ForegroundColor Green
Write-Host ""

# Etiquetar la imagen
Write-Host "5. Etiquetando imagen para Docker Hub..." -ForegroundColor Yellow
docker tag task-manager:latest "$dockerUser/task-manager:latest"
Write-Host "✓ Imagen etiquetada: $dockerUser/task-manager:latest" -ForegroundColor Green
Write-Host ""

# Push a Docker Hub
Write-Host "6. Subiendo imagen a Docker Hub..." -ForegroundColor Yellow
docker push "$dockerUser/task-manager:latest"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error subiendo imagen" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Imagen subida exitosamente" -ForegroundColor Green
Write-Host ""

# Información para Render
Write-Host "========================================" -ForegroundColor Green
Write-Host "PRÓXIMOS PASOS - DEPLOYMENT EN RENDER" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "1. Accede a: https://dashboard.render.com" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Crea un nuevo Web Service con:" -ForegroundColor Cyan
Write-Host "   - Image URL: docker.io/$dockerUser/task-manager:latest" -ForegroundColor White
Write-Host "   - Instance Type: Free" -ForegroundColor White
Write-Host "   - Region: Frankfurt" -ForegroundColor White
Write-Host ""
Write-Host "3. Variables de entorno:" -ForegroundColor Cyan
Write-Host "   - PORT=8080" -ForegroundColor White
Write-Host "   - JAVA_TOOL_OPTIONS=-Xmx512m" -ForegroundColor White
Write-Host ""
Write-Host "4. Para dominio personalizado:" -ForegroundColor Cyan
Write-Host "   - Ve a Settings → Custom Domain" -ForegroundColor White
Write-Host "   - Configura CNAME en tu proveedor DNS" -ForegroundColor White
Write-Host ""
Write-Host "Instrucciones completas en: DEPLOYMENT.md" -ForegroundColor Yellow
Write-Host ""
