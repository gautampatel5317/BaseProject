FROM php:7.2-fpm
#SET USER-ID AND GROUP-ID
ARG UNAME=www
ARG UID=1000
ARG GID=1000
# Set working directory
WORKDIR /var/www
# Install dependencies
RUN apt-get update \
 && apt-get install -y \
    mariadb-client \
  && docker-php-ext-install pdo_mysql mbstring exif pcntl \
 && rm -rf /var/lib/apt/lists/*       
# Add user for laravel application
RUN groupadd -g $GID -o $UNAME
RUN useradd -r -u $UID -g $GID -o -s /bin/bash $UNAME
# Copy composer.lock and composer.json
#RUN cd ../Ticket5stars
ADD  ./composer.json /var/www/
# Copy existing application directory contents
ADD ./ /var/www
# existing application directory permissions
RUN chown -R $UNAME:$UNAME /var/www/bootstrap storage/logs
# Change current user to www
USER $UNAME
# Run script
#ENTRYPOINT ["/bin/sh", "/usr/local/bin/start.sh"]
# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
