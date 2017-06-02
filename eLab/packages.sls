{% from "eLab-portal-formula/eLab/map.jinja" import eLab with context %}

#
# Install useful packages
#
eLab_packages:
  pkg.installed:
    - pkgs: {{ eLab.pkgs|json }}

#
# Once pip is installed get the pip related pkgs 
#
requests:
  pip.installed:
    - require:
      - pkg: eLab_packages
