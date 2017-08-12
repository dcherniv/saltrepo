common_packages:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'CentOS' %}
      - vim-enhanced
      {% elif grains['os'] == 'Ubuntu' %}
      - vim
      {% endif %}
      - nano  
