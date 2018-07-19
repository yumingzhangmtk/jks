FROM nginx:latest

RUN echo "peter 1.1 test `date`" > /usr/share/nginx/html/index.html

EXPOSE 80

