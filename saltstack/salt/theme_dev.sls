# This state is intended to handle nuances specific to Wordpress theme development.
# IMPORTANT: This state will error out if the 'dev_theme_name' value is not set in the pillar!
{% set wp_theme_name = pillar['dev_theme_name'] %}
# TODO Determine a way to usthe Wordpress formula's map for consistency
{% set map = { 'docroot': '/var/www/html' } %}

include:
  - apache
  - mysql
  - php
  - wordpress

# Before we start setting up Wordpress, we need the LAMP stack; enforced via 'require'

# Once the LAMP stack is in place, we can install and configure Wordpress

# This Jinja loop is excessive, but it allows us to simplify the pillar data
{% for id, site in salt['pillar.get']('wordpress:sites', {}).items() %}

# TODO Ensure that the theme is specified and the folder exists
# Then, we need to ensure that our theme is linked from the Vagrant share
install_wp_theme_{{ id }}:
  file.symlink:
    - src: /vagrant/{{ wp_theme_name }}
    - path: {{ map.docroot }}/{{ id }}/wp-content/themes/{{ wp_theme_name }}
    - require:
      - apache
      - mysql
      - php
      - wordpress
    - onchanges_in:
      - activate_{{ wp_theme_name }}

# And finally, make it the active theme
# This should be handled by the 'onchanges_in' condition
# FIXME Continued work with the Wordpress formula suggests that it may be better suited to a module


{% endfor %}