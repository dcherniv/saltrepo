include:
  - common.repos

mysql:
  pkg.installed:
    - pkgs:
      - Percona-XtraDB-Cluster-client-57
      - Percona-XtraDB-Cluster-server-57
    - require:
      - sls: common.repos

