FROM php:7.4-apache

RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /var/www/html

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Copy application files
COPY . .

# Set file permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

# Expose port 8080
EXPOSE 8080

# Start the Apache server
CMD ["apache2-foreground"]
