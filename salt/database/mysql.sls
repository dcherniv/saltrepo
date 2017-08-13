include:
  - common.repos

mysql:
  pkg.installed:
    - pkgs:
      - Percona-XtraDB-Cluster-client-57
      - Percona-XtraDB-Cluster-server-57
      - MySQL-python
    - require:
      - sls: common.repos

  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql
      - cmd: mysql_initialize

mysql_initialize:
  cmd.run:
    - name: mysqld --initialize-insecure --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    - user: root
    - creates: /var/lib/mysql/mysql/
    - require:
      - pkg: mysql
  
mysql.user_chpass:
  module.run:
    - user: root
    - host: 'localhost'
    - password: '{{ salt['pillar.get']('mysql:users:root:password', "") }}'
    - unless: mysql -uroot -p{{ salt['pillar.get']('mysql:users:root:password', "") }} mysql -e "select 1 from mysql.user;"

