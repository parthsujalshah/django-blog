FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY Docker/nginx/nginx-proxy.conf /etc/nginx/conf.d
EXPOSE 80