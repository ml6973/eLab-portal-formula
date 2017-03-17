{% set mysql_root_password = salt['pillar.get']('eLab:mysql:server:root_password', salt['grains.get']('server_id')) %}


#
# Install useful packages
#
eLab_packages:
  pkg:
    - installed
    - pkgs:
      - apache2 
      - git 
      - vim 
      - curl 
      - tmux 
      - mysql-server
      - php5 
      - php5-curl
      - php5-mysql
      - php5-dev
      - php-pear
      - python-pip
      - python-dev
      - libmysqlclient-dev
#
# Once pip is installed get the pip related pkgs 
#
MySQL-python:
  pip.installed:
    - require:
      - pkg: eLab_packages

requests:
  pip.installed:
    - require:
      - pkg: eLab_packages

#
# Restart apache2 and make sure it is running
#
apache2:
  service.running:
    - restart: True
    - watch:
      - file: /etc/php5/apache2/php.ini

#
# Enable mod_rewrite for eLab
#
Apache mod_rewrite:
  apache_module.enable:
    - name: rewrite
#
# Steps for getting MongoDB installed
#
import MongoDB key for Mongo pkg:
  cmd.run:
    - name: sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

get source file for MongoDB pkgs:
  cmd.run:
    - name: echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

update Mongo Pkgs:
  cmd.run:
    - name: sudo apt-get update

get the actual MongoiDB pkg:
  cmd.run:
    - name: sudo apt-get install -y mongodb-org

install Mongo PHP library:
  cmd.run:
    - name: sudo pecl install mongo

/root/mongo_creatUser.txt:
  file.managed:
    - source: salt://eLab-portal-formula/files/mongo_createUser.txt
    - user: root
    - group: root
    - mode: 644
    - template: jinja

create Mongo User:
  cmd.run:
    - name: sudo mongo < /root/mongo_createUser.txt
     
#
# Copy sql backup template, set mysql password and update the database
#
/root/eLab_backup.sql:
  file.managed:
    - source: salt://eLab-portal-formula/files/elab_ss.sql
    - user: root
    - group: root
    - mode: 644
    - template: jinja

{% if salt['grains.get']('mysql_password_updated') != True %}
set mysql password:
  cmd.run:
    - name: mysqladmin -u root password {{ mysql_root_password }}
  grains.present:
    - name: mysql_password_updated
    - value: True
{% endif %}

mysql -uroot -p{{ mysql_root_password }} < /root/eLab_backup.sql:
  cmd.run

#
# Clone git repo create data directory and copy web content
#
clone repo:
  git.latest:
    - name: https://github.com/ml6973/eLab-GUI-web-portal.git 
    - target: /opt/eLab-GUI-web-portal
    - rev: master

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
