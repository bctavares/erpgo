FROM php:8.2-apache

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libxml2-dev \
    zlib1g-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libonig-dev \
    && docker-php-ext-install \
    bcmath \
    ctype \
    fileinfo \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    zip

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação
COPY . /var/www/html

# Permissões (opcional)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
