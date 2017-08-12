include:
  - common.users

/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://templates/sudoers.esls
    - template: jinja    
    - require:
      - sls: common.users

