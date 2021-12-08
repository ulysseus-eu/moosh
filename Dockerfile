FROM php:7.4
RUN \
    # Utilities \
    echo -e "\n[i] Install often used tools\n" && \
    apt update && \
    apt install -y bzip2 nano curl git-core rsync unzip graphviz libpq-dev && \
    # PHP postgresql extension \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    ln -s /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    sed -i -e 's/;extension=pgsql/extension=pgsql/' /usr/local/etc/php/php.ini && \
    sed -i -e 's/;extension=pdo_pgsql/extension=pdo_pgsql/' /usr/local/etc/php/php.ini && \
    \
    # Composer \
    echo "\n[i] Install Composer\n" && \
    curl -sS https://getcomposer.org/installer | php && \
    chmod +x ./composer.phar && \
    mv ./composer.phar /usr/local/bin/composer && \
    composer require rybakit/msgpack && \
    \
    # Moosh \
    echo "\n[i] Install MOOSH\n" && \
    if [ ! -d /opt ]; then mkdir /opt ; fi && \
    cd /opt && \
    git clone git://github.com/tmuras/moosh.git && \
    cd moosh && \
    rm -rf .git && \
    composer install && \
    ln -s $PWD/moosh.php /bin/moosh

ENTRYPOINT ["/bin/bash"]
