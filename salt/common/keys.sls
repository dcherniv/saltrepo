include:
  - common.users

{% for user, args in salt['pillar.get']('users', {}).items() %}
/etc/ssh/keys/{{user}}:
  {% if args.disabled == True %}
  file.absent
  {% else%}
  file.managed:
    - user: {{ user }}
    - group: {{ args.gid }}
    - mode: 600
    - contents: {{ args.sshkey }}
    - require:
      - sls: common.users 
  {% endif %}
{% endfor %}
        
