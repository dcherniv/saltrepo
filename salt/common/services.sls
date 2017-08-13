include:
  - common.packages

atd:
  service:
    - running
    - enable: True
    - require: 
      - sls: common.packages

salt-minion:
  service:
    - running
    - enable: True
    - require:
      - sls: common.packages
