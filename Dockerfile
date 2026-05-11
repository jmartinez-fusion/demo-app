FROM nginxinc/nginx-unprivileged:alpine-slim

COPY index.html /usr/share/nginx/html/index.html

# Sobrescribimos la configuración por defecto con la nuestra
# En esta imagen, esta es la ruta estándar infalible
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080