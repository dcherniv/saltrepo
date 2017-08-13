include:
  - common.packages
  - common.services
  - database.mysql

/etc/salt/minion:
  file.managed:
    - owner: root
    - group: root
    - mode: 0644
    - source: salt://templates/minion.esls
    - template: jinja

restart_minion:
  cmd.wait:
    - name: "echo 'systemctl restart salt-minion'|at now + 1 min"
    - order: last
    - watch:
      - file: /etc/salt/minion
    - require:
      - sls: common.packages
      - sls: database.mysql
      - service: atd
      - service: salt-minion
