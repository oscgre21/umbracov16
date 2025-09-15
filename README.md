# Umbraco 16 con Docker

Este proyecto contiene una instalación de Umbraco CMS versión 16 con Docker y SQL Server.

## Requisitos

- Docker
- Docker Compose

## Configuración inicial

### Opción 1: Usar Docker directamente (Recomendado)

1. Asegúrate de que Docker esté instalado y en ejecución
2. Ejecuta el siguiente comando para construir e iniciar los contenedores:

```bash
docker-compose up --build
```

3. Espera a que los contenedores se inicien completamente
4. Accede a Umbraco en: http://localhost:8080

### Opción 2: Inicializar proyecto localmente (requiere .NET SDK 8.0)

Si tienes .NET SDK 8.0 instalado localmente:

```bash
# Dar permisos de ejecución al script
chmod +x init-project.sh

# Ejecutar el script de inicialización
./init-project.sh

# Luego iniciar con Docker
docker-compose up --build
```

## Credenciales por defecto

### Umbraco Admin
- **Usuario**: admin@example.com
- **Contraseña**: AdminPassword123!

### SQL Server
- **Usuario**: sa
- **Contraseña**: YourStrong!Passw0rd
- **Base de datos**: UmbracoDb
- **Puerto**: 1433

## Estructura del proyecto

```
umbracoV16/
├── Dockerfile              # Imagen Docker para la aplicación
├── docker-compose.yml      # Configuración de servicios Docker
├── UmbracoProject.csproj   # Archivo de proyecto .NET
├── Program.cs              # Punto de entrada de la aplicación
├── appsettings.json        # Configuración de la aplicación
├── appsettings.Development.json  # Configuración para desarrollo
├── .dockerignore           # Archivos ignorados por Docker
├── .gitignore              # Archivos ignorados por Git
└── umbraco/                # Directorio de datos de Umbraco (creado automáticamente)
    ├── media/              # Archivos multimedia
    ├── logs/               # Logs de la aplicación
    └── data/               # Datos de Umbraco
```

## Comandos útiles

### Detener los contenedores
```bash
docker-compose down
```

### Detener y eliminar volúmenes (reset completo)
```bash
docker-compose down -v
```

### Ver logs
```bash
docker-compose logs -f umbraco
```

### Reconstruir la imagen
```bash
docker-compose build --no-cache
```

## Configuración de producción

Para usar en producción:

1. Cambia las contraseñas en `docker-compose.yml` y `appsettings.json`
2. Configura HTTPS con certificados SSL
3. Ajusta los límites de recursos en Docker
4. Configura backups para la base de datos
5. Establece `ASPNETCORE_ENVIRONMENT=Production`

## Solución de problemas

### El contenedor no inicia
- Verifica que los puertos 8080 y 1433 no estén en uso
- Revisa los logs con `docker-compose logs`

### Error de conexión a base de datos
- Espera unos segundos para que SQL Server se inicie completamente
- Verifica las credenciales en `appsettings.json`

### Cambios no se reflejan
- Reconstruye la imagen con `docker-compose build --no-cache`
- Elimina volúmenes antiguos con `docker-compose down -v`

## Enlaces útiles

- [Documentación oficial de Umbraco](https://docs.umbraco.com/)
- [Umbraco 16 Installation Guide](https://docs.umbraco.com/umbraco-cms/fundamentals/setup/install)
- [Docker Hub - Umbraco Images](https://hub.docker.com/r/umbraco/umbraco)