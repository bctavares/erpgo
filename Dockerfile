FROM php:8.2-apache

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install \
    bcmath \
    ctype \
    fileinfo \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    && docker-php-ext-enable \
    bcmath \
    ctype \
    fileinfo \
    mbstring \
    pdo \
    tokenizer \
    xml

# Instala extensões adicionais
RUN a2enmod rewrite && service apache2 restart

# Copia os arquivos do projeto
WORKDIR /var/www/html
COPY . /var/www/html

# Corrige permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
