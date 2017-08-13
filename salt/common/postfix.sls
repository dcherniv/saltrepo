include:
  - common.packages
  - common.repos

postfix:
  pkg.installed:
    - pkgs:
      - postfix
    - require:
      - sls: common.repos    
