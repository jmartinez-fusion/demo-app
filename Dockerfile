FROM registry.access.redhat.com/ubi8/nginx-120

USER root

# Copiamos los archivos
COPY index.html /opt/app-root/src/index.html
COPY nginx.conf /opt/app-root/etc/nginx.d/proxy.conf

# Permisos para el usuario 1001 (estándar OCP)
RUN chown -R 1001:0 /opt/app-root && chmod -R g+rwX /opt/app-root

USER 1001

# Esta vez el test de Nginx pasará porque el location está dentro de un server
RUN nginx -t