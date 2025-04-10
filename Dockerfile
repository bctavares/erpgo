FROM php:8.2-apache

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libxml2-dev \
    unzip \
    && docker-php-ext-install \
    bcmath \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    && docker-php-ext-enable opcache

# Habilita o mod_rewrite do Apache (muito comum em apps PHP)
RUN a2enmod rewrite

# Define diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação
COPY . .

# Dá permissões ao Apache
RUN chown -R www-data:www-data /var/www/html

# Expõe a porta padrão
EXPOSE 80
