FROM nginx:latest

RUN echo "20180718v6" > /usr/share/nginx/html/index.html

EXPOSE 80

