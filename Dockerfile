FROM registry.access.redhat.com/ubi8/nginx-120

# S2I espera el código en esta ruta
COPY index.html /opt/app-root/src/index.html

# S2I busca archivos de configuración adicionales aquí
# IMPORTANTE: El nombre del archivo debe terminar en .conf
COPY nginx.conf /opt/app-root/etc/nginx.default.d/proxy.conf

# No necesitas EXPOSE ni USER, la imagen base ya los trae configurados