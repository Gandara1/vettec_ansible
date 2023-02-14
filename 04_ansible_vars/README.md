# Using Variables
https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html

Ansible uses variables to manage differences between systems. With Ansible, you can execute tasks and playbooks on multiple different systems with a single command. To represent the variations among those different systems, you can create variables with standard YAML syntax, including lists and dictionaries. You can define these variables in your playbooks, in your inventory, in re-usable files or roles, or at the command line. You can also create variables during a playbook run by registering the return value or values of a task as a new variable.

After you create variables, either by defining them in a file, passing them at the command line, or registering the return value or values of a task as a new variable, you can use those variables in module arguments, in conditional “when” statements, in templates, and in loops. The ansible-examples github repository contains many examples of using variables in Ansible.

Once you understand the concepts and examples on this page, read about Ansible facts, which are variables you retrieve from remote systems.

Creating valid variable names

Not all strings are valid Ansible variable names. A variable name can only include letters, numbers, and underscores. Python keywords or playbook keywords are not valid variable names. A variable name cannot begin with a number.

Variable names can begin with an underscore. In many programming languages, variables that begin with an underscore are private. This is not true in Ansible. Variables that begin with an underscore are treated exactly the same as any other variable. Do not rely on this convention for privacy or security.

    Valid variable names
	foo 	
    foo_env 	
    foo_port 
    foo5, _foo 	

---    


    Not valid
    *foo, Python keywords such as async and lambda
    playbook keywords such as environment
    5foo, 12


Defining simple variables

You can define a simple variable using standard YAML syntax. For example:

    remote_install_path: /opt/my_app_config

Referencing simple variables

After you define a variable, use Jinja2 syntax to reference it. Jinja2 variables use double curly braces. For example, the expression My amp goes to {{ max_amp_value }} demonstrates the most basic form of variable substitution. You can use Jinja2 syntax in playbooks. For example:

    ansible.builtin.template:
    src: foo.cfg.j2
    dest: '{{ remote_install_path }}/foo.cfg'

In this example, the variable defines the location of a file, which can vary from one system to another.

###### Note
Ansible allows Jinja2 loops and conditionals in templates but not in playbooks. You cannot create a loop of tasks. Ansible playbooks are pure machine-parseable YAML.

Defining variables in a play

You can define variables directly in a playbook play:

- hosts: webservers
  vars:
    http_port: 80

When you define variables in a play, they are only visible to tasks executed in that play.
Defining variables in included files and roles

You can define variables in reusable variables files and/or in reusable roles. When you define variables in reusable variable files, the sensitive variables are separated from playbooks. This separation enables you to store your playbooks in a source control software and even share the playbooks, without the risk of exposing passwords or other sensitive and personal data. For information about creating reusable files and roles, see Re-using Ansible artifacts.

This example shows how you can include variables defined in an external file:

---

- hosts: all
  remote_user: root
  vars:
    favcolor: blue
  vars_files:
    - /vars/external_vars.yml

  tasks:

  - name: This is just a placeholder
    ansible.builtin.command: /bin/echo foo


