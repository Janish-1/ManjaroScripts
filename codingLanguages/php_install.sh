sudo pacman -Syu php-apache php-cgi php-fpm php-gd  php-embed php-intl php-redis php-snmp php-enchant php-odbc php-xsl php-tidy php-sodium php-pgsql php-sqlite php-pspell php-mongodb php-dblib
sudo sed -i 's/^LoadModule mpm_event_module modules\/mod_mpm_event\.so/#LoadModule mpm_event_module modules\/mod_mpm_event.so/' /etc/httpd/conf/httpd.conf
sudo sed -i 's/^#LoadModule mpm_prefork_module modules\/mod_mpm_prefork\.so/LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/' /etc/httpd/conf/httpd.conf
if ! grep -q -E '^LoadModule php_module modules/libphp.so$|^AddHandler php-script .php$|^Include conf/extra/php_module.conf$' /etc/httpd/conf/httpd.conf; then
    echo -e "\nLoadModule php_module modules/libphp.so\nAddHandler php-script .php\nInclude conf/extra/php_module.conf" | sudo tee -a /etc/httpd/conf/httpd.conf
fi
sudo apachectl configtest
sudo apachectl restart
echo '<?php phpinfo(); ?>' | sudo tee /srv/http/info.php