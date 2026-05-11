FROM registry.access.redhat.com/ubi8/nginx-120:latest

# Copiamos nuestro HTML al directorio de nginx
COPY index.html /tmp/src/index.html

# El builder de OpenShift ya sabe qué hacer con /tmp/src, 
# pero para ser explícitos y universales:
RUN cp /tmp/src/index.html /opt/app-root/src/index.html

# Exponemos el puerto 8080 (Estándar non-root)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]