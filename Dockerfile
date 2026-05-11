FROM registry.access.redhat.com/ubi8/nginx-120

USER root

# El HTML en su sitio
COPY index.html /opt/app-root/src/index.html

# INYECCIÓN DENTRO DEL SERVER EXISTENTE
# Nota: La carpeta es 'nginx.default.d', NO 'nginx.d'
COPY nginx.conf /opt/app-root/etc/nginx.default.d/proxy.conf

# Permisos
RUN chown -R 1001:0 /opt/app-root && chmod -R g+rwX /opt/app-root

USER 1001

# El test seguirá pasando, pero ahora sin conflicto de puertos
RUN nginx -t