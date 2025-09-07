# 1. Usar una imagen base ligera que incluya Node.js y npm
FROM node:lts-alpine

# 2. Instalar 'live-server' de forma global dentro del contenedor
RUN npm install -g live-server

# 3. Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# 4. Copiar todos los archivos del proyecto al directorio de trabajo del contenedor
# (Los archivos ignorados en .dockerignore no se copiarán)
COPY . .

# 5. Exponer el puerto que usará live-server dentro del contenedor
EXPOSE 8080

# 6. Comando para iniciar el servidor cuando se ejecute el contenedor
# --host=0.0.0.0 es crucial para que sea accesible desde fuera del contenedor
# --no-browser para que no intente abrir un navegador
CMD ["live-server", "--host=0.0.0.0", "--port=8080", "--no-browser"]
