FROM nginx:latest

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo `date` > /usr/share/nginx/html/index.html
RUN echo "peter's 1st test in mediatek" >> /usr/share/nginx/html/index.html

EXPOSE 80

