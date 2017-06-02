#
# Steps for getting MongoDB installed
#
php-pear:
  pkg.installed

mongo:
  pecl.installed:
    - require:
      - pkg: php-pear

import MongoDB key for Mongo pkg:
  cmd.run:
    - name: sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

mongo_pkg:
  pkgrepo.managed:
    - humanname: Mongo upstream package repository
    - file: /etc/apt/sources.list.d/mongodb-org-3.0.list
    - name: deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse
    - require_in:
      - pkg: mongo
  pkg.installed:
    - pkgs:
      - mongodb-org

#get source file for MongoDB pkgs:
#  cmd.run:
#    - name: echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

#update Mongo Pkgs:
#  cmd.run:
#    - name: sudo apt-get update

#get the actual MongoDB pkg:
#  cmd.run:
#    - name: sudo apt-get install -y mongodb-org

/root/mongo_createUser.txt:
  file.managed:
    - source: salt://eLab-portal-formula/files/mongo_createUser.txt
    - user: root
    - group: root
    - mode: 644
    - template: jinja

create Mongo User:
  cmd.run:
    - name: sudo mongo < /root/mongo_createUser.txt
