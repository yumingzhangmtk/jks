FROM nginx:latest

RUN echo "20180718v7" > /usr/share/nginx/html/index.html

EXPOSE 80

