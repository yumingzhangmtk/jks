FROM nginx:latest

RUN echo "20180718v5" > /usr/share/nginx/html/index.html

EXPOSE 80

