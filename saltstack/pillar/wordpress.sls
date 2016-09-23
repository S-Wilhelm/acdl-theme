# Normally, these settings would be split into separate pillar files;
# however, we need to ensure that some of the values are consistent,
# so a single file is being used for convenience
wordpress:
  cli:
    source: https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    hash:  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar.sha512
  lookup:
    docroot: /var/www/html
  sites:
  # TODO Determine how to properly configure the site; I suspect I need to map an Apache vhost
    acdl-dev:
      username: acdldev
      password: '9@7h371Cp@$$'
      database: wp_acdldev
      dbhost: localhost
      dbuser: acdlwp
      dbpass: '9@7h371Cp@$$'
      url: 192.168.56.50
      title: 'Ashtabula County District Library - Dev Site'
      email: root@localhost

mysql:
  server:
    root_user: 'admin'
    root_password: ''
    user: mysql
    host: localhost
  salt_user:
    salt_user_name: 'salt'
    salt_user_password: '9@7h371Cp@$$'
    grants:
      - 'all privileges'
  # TODO Specify the Wordpress database user