include:
  - common.repos

postgres:
  pkg.installed:
    - pkgs:
      - postgresql

    - require:
      - sls: common.repos

