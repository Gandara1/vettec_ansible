# Ansible Configuration Settings
https://docs.ansible.com/ansible/latest/reference_appendices/config.html

Ansible supports several sources for configuring its behavior, including an ini file named ansible.cfg, environment variables, command-line options, playbook keywords, and variables. See Controlling how Ansible behaves: precedence rules for details on the relative precedence of each source.

The ansible-config utility allows users to see all the configuration settings available, their defaults, how to set them and where their current value comes from. See ansible-config for more information.
The configuration file

Changes can be made and used in a configuration file which will be searched for in the following order:

        ANSIBLE_CONFIG (environment variable if set)

        ansible.cfg (in the current directory)

        ~/.ansible.cfg (in the home directory)

        /etc/ansible/ansible.cfg

Ansible will process the above list and use the first file found, all others are ignored.

The configuration file is one variant of an INI format. Both the hash sign (#) and semicolon (;) are allowed as comment markers when the comment starts the line. However, if the comment is inline with regular values, only the semicolon is allowed to introduce the comment. For instance:

# some basic default values...
    inventory = /etc/ansible/hosts  ; This points to the file that lists your hosts

