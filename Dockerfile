FROM php:7.4.1 

RUN docker-php-ext-install mysqli pdo_mysql pdo

#RUN apt update; \apt upgrade -y;

WORKDIR /app
COPY ./app .

RUN chmod 777 /app/html/uploads/

EXPOSE 80

RUN useradd -ms /bin/bash adminapi
USER adminapi

CMD cd /app/html; php -S 0.0.0.0:80