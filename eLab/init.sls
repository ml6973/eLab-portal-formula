{% from "eLab-portal-formula/eLab/map.jinja" import eLab with context %}
{% set mysql_root_password = eLab.mysql.server.root_password %}

include:
  - eLab-portal-formula.eLab.packages
{% if grains['environment'] == 'develop' %}
  - eLab-portal-formula.eLab.mongo
  - eLab-portal-formula.eLab.mysql
{% endif %}

#
# Restart apache2 and make sure it is running
# Configure
#
apache2:
  service.running:
    - restart: True
    - watch:
      - file: /etc/php5/apache2/php.ini

Apache mod_rewrite:
  apache_module.enabled:
    - name: rewrite

#
# Clone git repo create data directory and copy web content
#
clone repo:
  git.latest:
    - name: {{ grains['eLab_portal']['REPO'] }}
    - rev: {{ grains['eLab_portal']['BRANCH'] }}
    - target: /opt/eLab-GUI-web-portal
    #- name: https://github.com/ml6973/eLab-GUI-web-portal.git

/var/www/html/eLab-GUI-web-portal:
  file.directory:
    - makedirs: True

copy web content:
  cmd.run:
    - name: cp -rf /opt/eLab-GUI-web-portal/WebContent/. /var/www/html/eLab-GUI-web-portal/
  file.directory:
    - name: /var/www/html/eLab-GUI-web-portal
    - user: www-data
    - group: www-data
    - recurse:
      - user
      - group

remove index.html:
  file.absent: 
    - name: /var/www/html/index.html

/var/www/html/index.php:
  file.managed:
    - source: salt://eLab-portal-formula/files/index.php

/var/www/myConfig.ini:
  file.managed:
    - source: salt://eLab-portal-formula/files/myConfig.ini
    - template: jinja
    - defaults:
      mysql_root_password: {{ mysql_root_password }}

/etc/apache2/sites-available/000-default.conf:
  file.managed:
    - source: salt://eLab-portal-formula/files/000-default.conf

/etc/php5/apache2/php.ini:
  file.managed:
    - source: salt://eLab-portal-formula/files/php.ini
    - template: jinja

service apache2 restart:
  cmd.run

Mongo curl cmd to initialize on Apache:
  cmd.run:
    - name: curl -X GET http://127.0.0.1/eLab-GUI-web-portal/tests/makeMongo_tests.php
