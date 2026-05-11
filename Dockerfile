# Usamos la imagen que ya tienes (basada en RHEL/CentOS por la estructura de carpetas)
FROM registry.access.redhat.com/ubi8/nginx-120

# El HTML debe ir en /opt/app-root/src
COPY index.html /opt/app-root/src/index.html

# El archivo de configuración debe ir en esta carpeta específica para que se cargue
# IMPORTANTE: El archivo debe terminar en .conf
COPY nginx.conf /opt/app-root/etc/nginx.d/proxy.conf

EXPOSE 8080