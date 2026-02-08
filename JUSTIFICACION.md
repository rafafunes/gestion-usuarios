## Justificación de Decisiones Técnicas

### **¿Por qué Arquitectura en Capas?**
> **Decisión:** Implementar separación Controller → Service → Repository  
> **Razón:** Facilita el mantenimiento, permite testear cada capa independientemente, y hace el código escalable. Cada capa tiene una responsabilidad única y bien definida. Es el estándar para aplicaciones empresariales.

### **¿Por qué Inyección por Constructor?**
> **Decisión:** Usar inyección por constructor en lugar de `@Autowired` en campos  
> **Razón:** Hace las dependencias inmutables (final), facilita el testing con mocks, previene NullPointerException, y es la práctica recomendada por Spring Framework desde la versión 4.3.

### **¿Por qué GlobalExceptionHandler?**
> **Decisión:** Centralizar manejo de errores con `@RestControllerAdvice`  
> **Razón:** Evita código duplicado try-catch en controladores, proporciona respuestas consistentes en toda la API, separa la lógica de manejo de errores, y facilita el logging centralizado.

### **¿Por qué Docker Multi-Stage?**
> **Decisión:** Usar construcción en dos etapas (build + runtime)  
> **Razón:** Reduce el tamaño de la imagen en un 67% (~200MB vs ~600MB), mejora la seguridad al eliminar herramientas de build de la imagen final, y optimiza el tiempo de despliegue especialmente en CI/CD.

### **¿Por qué H2 en Memoria?**
> **Decisión:** Base de datos H2 en memoria para desarrollo  
> **Razón:** Acelera el desarrollo sin necesidad de instalar BD externa, es ideal para testing y prototipado rápido, incluye consola web para visualización, y facilita el reset de datos. En producción se cambiaría a PostgreSQL o MySQL.

### **¿Por qué Spring Data JPA?**
> **Decisión:** Usar Spring Data JPA en lugar de queries SQL manuales  
> **Razón:** Reduce drásticamente el código boilerplate, proporciona implementaciones automáticas de CRUD, permite queries derivadas del nombre del método, gestiona transacciones automáticamente, y abstrae el vendor de base de datos.

### **¿Por qué Validación en Dos Niveles?**
> **Decisión:** Validar en la capa de servicio Y en la base de datos  
> **Razón:** Validación en servicio proporciona feedback rápido al usuario, validación en BD garantiza integridad incluso ante fallos de la aplicación, previene race conditions, y es defensa en profundidad (defense in depth).