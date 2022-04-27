# Roles
https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html

Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content in roles, you can easily reuse them and share them with other users.

Role directory structure

An Ansible role has a defined directory structure with eight main standard directories. You must include at least one of these directories in each role. You can omit any directories the role does not use. For example:

    # playbooks
    site.yml
    webservers.yml
    fooservers.yml
    roles/
        common/
            tasks/
            handlers/
            library/
            files/
            templates/
            vars/
            defaults/
            meta/
        webservers/
            tasks/
            defaults/
            meta/

By default Ansible will look in each directory within a role for a main.yml file for relevant content (also main.yaml and main):

    tasks/main.yml - the main list of tasks that the role executes.

    handlers/main.yml - handlers, which may be used within or outside this role.

    library/my_module.py - modules, which may be used within this role (see Embedding modules and plugins in roles for more information).

    defaults/main.yml - default variables for the role (see Using Variables for more information). These variables have the lowest priority of any variables available, and can be easily overridden by any other variable, including inventory variables.

    vars/main.yml - other variables for the role (see Using Variables for more information).

    files/main.yml - files that the role deploys.

    templates/main.yml - templates that the role deploys.

    meta/main.yml - metadata for the role, including role dependencies.

You can add other YAML files in some directories. For example, you can place platform-specific tasks in separate files and refer to them in the tasks/main.yml file:

    # roles/example/tasks/main.yml
    - name: Install the correct web server for RHEL
      import_tasks: redhat.yml
      when: ansible_facts['os_family']|lower == 'redhat'

    - name: Install the correct web server for Debian
      import_tasks: debian.yml
      when: ansible_facts['os_family']|lower == 'debian'

    # roles/example/tasks/redhat.yml
    - name: Install web server
      ansible.builtin.yum:
        name: "httpd"
        state: present

    # roles/example/tasks/debian.yml
    - name: Install web server
      ansible.builtin.apt:
        name: "apache2"
        state: present

Using roles at the play level

The classic (original) way to use roles is with the roles option for a given play:

    ---
    - hosts: webservers
      roles:
        - common
        - webservers

When you use the roles option at the play level, for each role ‘x’:

    If roles/x/tasks/main.yml exists, Ansible adds the tasks in that file to the play.

    If roles/x/handlers/main.yml exists, Ansible adds the handlers in that file to the play.

    If roles/x/vars/main.yml exists, Ansible adds the variables in that file to the play.

    If roles/x/defaults/main.yml exists, Ansible adds the variables in that file to the play.

    If roles/x/meta/main.yml exists, Ansible adds any role dependencies in that file to the list of roles.

    Any copy, script, template or include tasks (in the role) can reference files in roles/x/{files,templates,tasks}/ (dir depends on task) without having to path them relatively or absolutely.

When you use the roles option at the play level, Ansible treats the roles as static imports and processes them during playbook parsing. Ansible executes your playbook in this order:

    Any pre_tasks defined in the play.

    Any handlers triggered by pre_tasks.

    Each role listed in roles:, in the order listed. Any role dependencies defined in the role’s meta/main.yml run first, subject to tag filtering and conditionals. See Using role dependencies for more details.

    Any tasks defined in the play.

    Any handlers triggered by the roles or tasks.

    Any post_tasks defined in the play.

    Any handlers triggered by post_tasks.
