# Gestión de Usuarios - API REST

API REST para la gestión de usuarios desarrollada con Spring Boot.

## 📋 Descripción

Aplicación backend para gestionar usuarios con operaciones CRUD (Crear, Leer, Actualizar, Eliminar), implementada con Spring Boot, Spring Security y base de datos H2 en memoria.

## 🛠️ Tecnologías

- **Java 17**
- **Spring Boot 3.5.10**
- **Spring Data JPA**
- **Spring Security**
- **H2 Database** (base de datos en memoria)
- **Maven**
- **Docker**

## 📌 Requisitos Previos

### Para ejecución local:
- Java JDK 17 o superior
- Maven 3.6+ (o usar el wrapper incluido `mvnw`)

### Para ejecución con Docker:
- Docker instalado

## 🚀 Cómo Ejecutar el Proyecto

### Opción 1: Ejecución Local con Maven

1. **Clonar o descargar el proyecto**

2. **Navegar al directorio del proyecto**
   ```bash
   cd gestion-usuarios
   ```

3. **Compilar el proyecto**
   ```bash
   ./mvnw clean package
   ```
   O en Windows:
   ```bash
   mvnw.cmd clean package
   ```

4. **Ejecutar la aplicación**
   ```bash
   ./mvnw spring-boot:run
   ```
   O en Windows:
   ```bash
   mvnw.cmd spring-boot:run
   ```

5. **La aplicación estará disponible en:**
   ```
   http://localhost:8080
   ```

### Opción 2: Ejecutar JAR directamente

Después de compilar el proyecto, puedes ejecutar el JAR generado:

```bash
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

### Opción 3: Ejecución con Docker

1. **Construir la imagen Docker**
   ```bash
   docker build -t usuarios-app .
   ```

2. **Ejecutar el contenedor**
   ```bash
   docker run -d --name Gestion-Usuarios -p 8081:8081 usuarios-app
   ```

3. **Ver logs del contenedor**
   ```bash
   docker logs Gestion-Usuarios
   ```

4. **Detener el contenedor**
   ```bash
   docker stop Gestion-Usuarios
   ```

5. **Eliminar el contenedor**
   ```bash
   docker rm Gestion-Usuarios
   ```

## 📡 Endpoints de la API

Base URL: `http://localhost:8080/api/users`

### Crear Usuario
```http
POST /api/users
Content-Type: application/json

{
  "name": "Rafael Funes",
  "email": "rafael@example.com",
  "username": "rafaelfunes"
}
```

### Obtener Todos los Usuarios
```http
GET /api/users
```

### Obtener Usuario por ID
```http
GET /api/users/{id}
```

### Eliminar Usuario
```http
DELETE /api/users/{id}
```

## 🔐 Seguridad

La aplicación utiliza Spring Security. Por defecto, todos los endpoints están protegidos. Verifica las configuraciones en [SecurityConfig.java](src/main/java/com/gestion/usuarios/config/SecurityConfig.java) para más detalles.

## 🗄️ Base de Datos H2

La aplicación utiliza H2, una base de datos en memoria para desarrollo y pruebas.

### Acceder a la Consola H2

1. Con la aplicación en ejecución, accede a:
   ```
   http://localhost:8080/h2-console
   ```

2. **Configuración de conexión:**
   - **JDBC URL:** `jdbc:h2:mem:testdb`
   - **User Name:** `sa`
   - **Password:** *(dejar vacío)*

3. Haz clic en "Connect"

## 📮 Colección de Postman

Hay una colección de Postman disponible para probar los endpoints de la API:

📁 `src/main/java/com/gestion/usuarios/docs/Gestion-Usuarios-Postman-Collection.json`

### Importar en Postman:
1. Abre Postman
2. Click en "Import"
3. Selecciona el archivo de la colección
4. Comienza a probar los endpoints

## 🧪 Ejecutar Tests

```bash
./mvnw test
```

O en Windows:
```bash
mvnw.cmd test
```

## 📁 Estructura del Proyecto

```
src/
├── main/
│   ├── java/com/gestion/usuarios/
│   │   ├── config/          # Configuraciones (Security, etc.)
│   │   ├── controller/      # Controladores REST
│   │   ├── entity/          # Entidades JPA
│   │   ├── exception/       # Manejadores de excepciones
│   │   ├── repository/      # Repositorios JPA
│   │   ├── service/         # Lógica de negocio
│   │   └── UsuariosApplication.java
│   └── resources/
│       └── application.properties
└── test/                    # Tests unitarios
```

## 🔧 Configuración

Las configuraciones principales se encuentran en [application.properties](src/main/resources/application.properties):

- Puerto de la aplicación: `8080`
- Base de datos: H2 en memoria
- Consola H2 habilitada en `/h2-console`
- JPA con Hibernate (DDL auto-update)

## 📝 Notas Adicionales

- La base de datos H2 es **en memoria**, por lo que los datos se pierden al reiniciar la aplicación
- Para entornos de producción, se recomienda cambiar a una base de datos persistente (PostgreSQL, MySQL, etc.)
- Los logs de SQL están habilitados para desarrollo (`spring.jpa.show-sql=true`)
- La seguridad en entorno local está deshabilitada, por defecto, en entorno productivo todos los endpoints están protegidos. Verifica las configuraciones en [SecurityConfig.java](src/main/java/com/gestion/usuarios/config/SecurityConfig.java) para más detalles de como habilitar entorno de PRODUCCION.

## 👨‍💻 Desarrollo

Para hacer cambios en el proyecto:

1. Realiza las modificaciones necesarias
2. Recompila el proyecto: `./mvnw clean package`
3. Ejecuta los tests: `./mvnw test`
4. Ejecuta la aplicación: `./mvnw spring-boot:run`

---

**¿Problemas?** Verifica que:
- Tienes Java 17 instalado: `java -version`
- El puerto 8080 no está en uso
- Maven está correctamente configurado (o usa los wrappers incluidos)
