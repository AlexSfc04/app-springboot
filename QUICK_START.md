# Quick Start Guide - Task Manager

## 🚀 Inicio Rápido

### Opción 1: Desde Línea de Comandos

#### 1. Abrir PowerShell o CMD en la carpeta del proyecto:
```
cd c:\Users\Alejandro\Desktop\App-SpringBoot
```

#### 2. Compilar el proyecto:
```
mvn clean install
```

#### 3. Ejecutar la aplicación:
```
mvn spring-boot:run
```

#### 4. Abrir en el navegador:
```
http://localhost:8080/
```

---

### Opción 2: Desde VS Code

1. **Abre la carpeta del proyecto en VS Code**
2. **Instala las extensiones recomendadas:**
   - Extension Pack for Java
   - Spring Boot Extension Pack

3. **Haz clic en "Spring Boot Dashboard"** en la barra lateral izquierda

4. **Selecciona "TaskManagerApplication" y presiona Run** (botón verde)

5. **Espera a que se compile e inicie la aplicación**

6. **Abre en tu navegador:** `http://localhost:8080/`

---

### Opción 3: Usando Maven Wrapper (si está disponible)

```
./mvnw spring-boot:run
```

---

## 📊 Endpoints de Prueba

### Test 1: Crear una tarea
**Método:** POST
**URL:** `http://localhost:8080/api/tasks`
**Body (JSON):**
```json
{
    "title": "Mi primer tarea",
    "description": "Esta es una tarea de prueba",
    "status": "PENDING",
    "priority": "HIGH"
}
```

### Test 2: Ver todas las tareas
**Método:** GET
**URL:** `http://localhost:8080/api/tasks`

### Test 3: Filtrar por estado
**Método:** GET
**URL:** `http://localhost:8080/api/tasks/status/PENDING`

### Test 4: Buscar tareas
**Método:** GET
**URL:** `http://localhost:8080/api/tasks/search?query=Spring`

### Test 5: Ver estadísticas
**Método:** GET
**URL:** `http://localhost:8080/api/tasks/stats/summary`

---

## 🎯 Pasos para Probar la Aplicación

1. **Abre la interfaz gráfica en:** `http://localhost:8080/`

2. **Verás el dashboard con:**
   - Estadísticas (Total, Pendientes, Completadas)
   - 5 tareas de ejemplo precargadas
   - Formulario para crear nuevas tareas

3. **Prueba las siguientes acciones:**
   - ✏️ Crear una nueva tarea con el formulario
   - 🔍 Buscar tareas usando la barra de búsqueda
   - 🔘 Filtrar por estado o prioridad
   - ✅ Marcar tareas como completadas
   - 🗑️ Eliminar tareas

---

## 🛑 Detener la Aplicación

### Desde línea de comandos:
- Presiona `Ctrl + C`

### Desde VS Code:
- Haz clic en el botón rojo de Stop en Spring Boot Dashboard

---

## 🆘 ¿Problemas?

### Error: "Port 8080 is already in use"
```
mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8081
```

### Error: "Could not find maven in path"
- Asegúrate de tener Maven instalado
- Descargalo desde: https://maven.apache.org/download.cgi

### Error: "Java version problem"
- Verifica tu versión de Java: `java -version`
- Debe ser Java 17 o superior
- Descárgalo desde: https://www.oracle.com/java/technologies/downloads/

---

## 📱 Características de la Interfaz

✅ **Crear tareas** con título, descripción, estado y prioridad
✅ **Ver todas las tareas** en una lista ordenada
✅ **Filtrar tareas** por estado o prioridad
✅ **Buscar tareas** por título o descripción
✅ **Marcar como completada** con un clic
✅ **Eliminar tareas** innecesarias
✅ **Ver estadísticas** en tiempo real
✅ **Diseño responsivo** que se adapta al móvil

---

## 🔐 Admin Access

### Consola H2 (Base de datos)
- URL: `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:taskdb`
- Username: `sa`
- Password: (dejar vacío)

---

¡Listo para usar! 🎉
