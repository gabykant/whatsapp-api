FROM php:8.3-fpm

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    libpq-dev \
    libmysqlclient-dev \
    mariadb-client \
    && docker-php-ext-install pdo pdo_mysql zip

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Créer un dossier de travail
WORKDIR /var/www

# Copier le projet
COPY . .

# Donner les bons droits
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Installer les dépendances Laravel
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Copier le script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Définir le point d’entrée
ENTRYPOINT ["/entrypoint.sh"]
