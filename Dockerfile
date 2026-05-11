FROM registry.access.redhat.com/ubi8/nginx-120

USER root

# Copiamos el HTML
COPY index.html /opt/app-root/src/index.html

# Cambiamos a la carpeta nginx.d (que se incluye en el bloque http, no necesariamente en el server)
# Esto es para probar si el error es de jerarquía
COPY nginx.conf /opt/app-root/etc/nginx.d/proxy.conf

# Aseguramos permisos para el usuario 1001
RUN chown -R 1001:0 /opt/app-root && chmod -R g+rwX /opt/app-root

USER 1001

# Comando de validación: Si el nginx.conf generado es inválido, el build fallará aquí
RUN nginx -t