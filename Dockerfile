FROM nginx:latest

RUN echo `date` > /usr/share/nginx/html/index.html
RUN echo "peter 1.1 test" >> /usr/share/nginx/html/index.html

EXPOSE 80

