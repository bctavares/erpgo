# Usa uma imagem base com PHP 8.2 e Apache
FROM php:8.2-apache

# Instala dependências do sistema e extensões do PHP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    unzip \
    && docker-php-ext-install \
    bcmath \
    ctype \
    fileinfo \
    json \
    mbstring \
    openssl \
    pdo \
    pdo_mysql \
    tokenizer \
    xml

# Habilita o mod_rewrite do Apache (comum para muitas aplicações PHP)
RUN a2enmod rewrite

# Define o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Copia os arquivos da aplicação para o container (ajuste conforme sua estrutura)
COPY . /var/www/html

# Dá permissões (ajuste conforme necessário)
RUN chown -R www-data:www-data /var/www/html

# Expõe a porta padrão do Apache
EXPOSE 80
