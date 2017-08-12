{% for user, args in salt['pillar.get']('users', {}).items() %}
/etc/ssh/keys/{{user}}:
  file.managed:
    - contents: {{ args.sshkey }}
{% endfor %}
      
