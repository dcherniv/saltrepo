include:
  - common.groups

{% for user, args in salt['pillar.get']('users', {}).items() %}
{{ user }}:
  {% if args.disabled == True %}
  user.absent:
    - purge: True
    - force: True
  {% else%}
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
  {% endif %}
{% endfor %}

