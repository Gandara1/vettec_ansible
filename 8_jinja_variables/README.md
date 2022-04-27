# Templating (Jinja2)

Ansible uses Jinja2 templating to enable dynamic expressions and access to [variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#playbooks-variables) and facts. You can use templating with the [template module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html#template-module). For example, you can create a template for a configuration file, then deploy that configuration file to multiple environments and supply the correct data (IP address, hostname, version) for each environment. You can also use templating in playbooks directly, by templating task names and more. You can use all the [standard filters and tests](https://jinja.palletsprojects.com/en/3.1.x/templates/#builtin-filters) included in Jinja2. Ansible includes additional specialized filters for selecting and transforming data, tests for evaluating template expressions, and [Lookup plugins](https://docs.ansible.com/ansible/latest/plugins/lookup.html#lookup-plugins) for retrieving data from external sources such as files, APIs, and databases for use in templating.

All templating happens on the Ansible controller before the task is sent and executed on the target machine. This approach minimizes the package requirements on the target (jinja2 is only required on the controller). It also limits the amount of data Ansible passes to the target machine. Ansible parses templates on the controller and passes only the information needed for each task to the target machine, instead of passing all the data on the controller and parsing it on the target.

## Delimiters Used in Jinja 2

    1.{% %} : used for control statements such as loops and if-else statements.

    2.{{ }} :These double curly braces are the widely used tags in a template file and they are used for embedding variables and ultimately printing their value during code execution.

    3.{# #} used for comments which are not included in the template output.
    The file extension of a jinja2 template is .j2.
    Jinja2 Templates

Jinja2 templates are simple template files that store variables that can change from time to time. When Playbooks are executed, these variables get replaced by actual values defined in Ansible Playbooks. This way, templating offers an efficient and flexible solution to create or alter configuration file with ease.

How to use Jinja2 template in Ansible?

Now that we know something about Jinja2 and syntax, we will use a Jinja2 template to configure customized files on our managed nodes.

Lets create templates project directory which we will use for this example. Here project means nothing but a new directory which contains everything your playbook needs such as ansible.cfg, inventory etc.

    [ansadmin@ansible-master ~]$ ls
    templates
    [ansadmin@ansible-master ~]$ cd templates/
    [ansadmin@ansible-master templates]$ ls
    ansible.cfg inventory
    [ansadmin@ansible-master templates]$

Lets create a simple inventory file with two managed nodes as server-a and server-b as shown bellow.

    [ansadmin@ansible-master templates]$ cat inventory
    [nodes]
    server-a.example.com
    server-b.example.com

Accessing Variables in JinJa2

Lets create a sample Jinja2 template with the name index.j2

    [ansadmin@ansible-master templates]$ cat index.j2 
    A message from {{ inventory_hostname }}
    {{ webserver_message }}