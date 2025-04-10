FROM php:8.2-apache

# Evita prompts durante a instalação
ARG DEBIAN_FRONTEND=noninteractive

# Atualiza e instala dependências
RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libpng-dev \
    libxml2-dev \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    zip

# Ativa módulos do Apache
RUN a2enmod rewrite

# Define diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação
COPY . .

# Corrige permissões
RUN chown -R www-data:www-data /var/www/html

# Expõe a porta padrão
EXPOSE 80
