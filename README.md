# 📋 Task Manager - Aplicación Spring Boot

Una aplicación web simple pero completa de gestión de tareas construida con **Spring Boot**, **Spring Data JPA**, y **H2 Database**.

## ✨ Características

- ✅ **API REST completa** para gestron de tareas
- 📊 **Dashboard interactivo** con estadísticas en tiempo real
- 🔍 **Búsqueda y filtrado** de tareas
- 🎯 **Estados de tareas**: Pendiente, En Progreso, Completada, Cancelada
- ⚡ **Niveles de prioridad**: Baja, Media, Alta, Urgente
- 💾 **Base de datos H2** (en memoria)
- 🎨 **Interfaz moderna y responsiva**
- 📱 **Diseño adaptable** para móvil y escritorio

## 🛠️ Requisitos Previos

- **Java 17** o superior
- **Maven 3.6+**
- Un navegador web moderno

## 📦 Estructura del Proyecto

```
App-SpringBoot/
├── pom.xml                                      # Configuración de Maven
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/taskmanager/
│   │   │       ├── TaskManagerApplication.java  # Clase principal
│   │   │       ├── controller/
│   │   │       │   ├── TaskController.java      # API REST
│   │   │       │   └── HomeController.java      # Servir HTML
│   │   │       ├── model/
│   │   │       │   └── Task.java                # Entidad
│   │   │       ├── repository/
│   │   │       │   └── TaskRepository.java      # Acceso a datos
│   │   │       ├── service/
│   │   │       │   └── TaskService.java         # Lógica de negocio
│   │   │       └── config/
│   │   │           └── DataLoader.java          # Datos de ejemplo
│   │   └── resources/
│   │       ├── application.properties           # Configuración
│   │       └── templates/
│   │           └── index.html                   # Frontend
│   └── test/
│       └── java/                                # Tests (opcional)
└── README.md                                    # Este archivo
```

## 🚀 Cómo Ejecutar

### 1. **Compilar el Proyecto**

```bash
cd c:\Users\Alejandro\Desktop\App-SpringBoot
mvn clean install
```

### 2. **Ejecutar la Aplicación**

```bash
mvn spring-boot:run
```

O también puedes ejecutar:
```bash
java -jar target/task-manager-1.0.0.jar
```

### 3. **Acceder a la Aplicación**

Abre tu navegador y ve a:
```
http://localhost:8080/
```

## 📚 API Endpoints

### Base URL
```
http://localhost:8080/api/tasks
```

### Endpoints Disponibles

#### **1. Crear una Tarea**
```
POST /tasks
Content-Type: application/json

{
    "title": "Mi tarea",
    "description": "Descripción de la tarea",
    "status": "PENDING",
    "priority": "HIGH"
}
```

#### **2. Obtener Todas las Tareas**
```
GET /tasks
```

#### **3. Obtener una Tarea por ID**
```
GET /tasks/{id}
```

#### **4. Filtrar por Estado**
```
GET /tasks/status/{status}
```
Estados válidos: `PENDING`, `IN_PROGRESS`, `COMPLETED`, `CANCELLED`

#### **5. Filtrar por Prioridad**
```
GET /tasks/priority/{priority}
```
Prioridades válidas: `LOW`, `MEDIUM`, `HIGH`, `URGENT`

#### **6. Buscar Tareas**
```
GET /tasks/search?query=tu_termino_busqueda
```

#### **7. Actualizar una Tarea**
```
PUT /tasks/{id}
Content-Type: application/json

{
    "title": "Título actualizado",
    "status": "IN_PROGRESS",
    "priority": "MEDIUM"
}
```

#### **8. Eliminar una Tarea**
```
DELETE /tasks/{id}
```

#### **9. Ver Estadísticas**
```
GET /tasks/stats/summary
```

Respuesta:
```json
{
    "total": 5,
    "completed": 1,
    "pending": 4
}
```

#### **10. Health Check**
```
GET /tasks/health
```

## 📋 Modelo de Datos

### Entity: Task

```java
{
    "id": 1,
    "title": "Estudiar Spring Boot",
    "description": "Aprender los conceptos básicos",
    "status": "IN_PROGRESS",
    "priority": "HIGH",
    "createdAt": "2024-02-20T10:30:00",
    "updatedAt": "2024-02-20T11:15:00"
}
```

**Estados Disponibles:**
- `PENDING` - Pendiente
- `IN_PROGRESS` - En Progreso
- `COMPLETED` - Completada
- `CANCELLED` - Cancelada

**Prioridades Disponibles:**
- `LOW` - Baja
- `MEDIUM` - Media
- `HIGH` - Alta
- `URGENT` - Urgente

## 🎯 Ejemplo de Uso con cURL

### Crear una tarea
```bash
curl -X POST http://localhost:8080/api/tasks \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Comprar leche",
    "description": "Ir al supermercado",
    "status": "PENDING",
    "priority": "MEDIUM"
  }'
```

### Obtener todas las tareas
```bash
curl http://localhost:8080/api/tasks
```

### Buscar tareas
```bash
curl http://localhost:8080/api/tasks/search?query=comprar
```

### Actualizar una tarea
```bash
curl -X PUT http://localhost:8080/api/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{
    "status": "COMPLETED"
  }'
```

### Eliminar una tarea
```bash
curl -X DELETE http://localhost:8080/api/tasks/1
```

## 🗄️ Base de Datos H2

La aplicación utiliza **H2 Database** (base de datos en memoria) que es perfecta para desarrollo y pruebas.

### Acceder a la Consola H2
```
http://localhost:8080/h2-console
```

**Credenciales:**
- URL de JDBC: `jdbc:h2:mem:taskdb`
- Usuario: `sa`
- Contraseña: (dejar en blanco)

## 🎨 Frontend

La interfaz incluye:

- **Dashboard** con estadísticas en tiempo real
- **Formulario** para crear nuevas tareas
- **Vista de tareas** con información completa
- **Filtros** por estado y prioridad
- **Búsqueda** de tareas
- **Acciones** para completar y eliminar tareas
- **Diseño responsivo** para móviles y escritorio

## 🔧 Customización

### Cambiar Puerto
Edita `application.properties`:
```properties
server.port=9000
```

### Cambiar Contexto de la API
Edita `application.properties`:
```properties
server.servlet.context-path=/api
```

### Usar otra Base de Datos
Puedes cambiar de H2 a MySQL, PostgreSQL, etc. modificando `pom.xml` y `application.properties`.

## 📝 Datos de Ejemplo

La aplicación carga automáticamente 5 tareas de ejemplo al iniciar:

1. Estudiar Spring Boot (En Progreso, Alta)
2. Comprar ingredientes (Pendiente, Media)
3. Revisar código (Completada, Alta)
4. Llamar al cliente (Pendiente, Urgente)
5. Escribir documentación (En Progreso, Media)

## 🐛 Solución de Problemas

### Puerto 8080 en uso
```bash
# En Windows, encuentra el proceso:
netstat -ano | findstr :8080

# Mata el proceso:
taskkill /PID <PID> /F

# O cambia el puerto en application.properties
server.port=8081
```

### Error de Maven
```bash
# Limpia la caché de Maven
mvn clean

# Descarga las dependencias nuevamente
mvn validate
```

### Error de Java versión
Asegúrate de tener Java 17+:
```bash
java -version
```

## 📚 Tecnologías Utilizadas

- **Spring Boot 3.2.0** - Framework web
- **Spring Data JPA** - ORM y acceso a datos
- **H2 Database** - Base de datos en memoria
- **Lombok** - Reducir código boilerplate
- **Maven** - Gestor de dependencias
- **HTML5 + CSS3 + JavaScript** - Frontend

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👨‍💻 Autor

Creado como una aplicación de ejemplo con Spring Boot.

---

¡Disfruta usando Task Manager! 🎉
# app-springboot
