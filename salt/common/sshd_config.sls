/etc/ssh/sshd_config:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://templates/sshd_config.esls
    - template: jinja    

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
