include:
  - common.groups

{% for user, args in salt['pillar.get']('users', {}).items() %}
{{ user }}:
  user.present:
    - fullname: {{ user }}
    - shell: /bin/bash
    - home: {{ args.home }}
    - unique: False
    - uid: {{ args.uid }}
    - gid: {{ args.gid }}
    - password: {{ args.password }}
    - groups:
      - wheel
    - require: 
      - sls: common.groups
{% endfor %}

