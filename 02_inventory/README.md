# Ansible Inventory

It's very common to have a list of hosts that you need to deploy, configure, maintain, etc. Ansible provides a method for keeping track of them in one convenient file, and even provides ways to group them together and provide aliases for more flexibility. \
Inventory files can be written in YAML , INI, or JSON, but in this course I will only be demonstrating them in INI. The default inventory file is located at /etc/ansible/hosts but you can overwrite the default location in your ansible.cfg configuration file, or you can provide your own configuration file when you run your Ansible commands. To specify a host file to use, pass the -i flag when running a command and provide the location to the file like this:

    ansible -i path/to/file -m module_name -a argument

You can even provide multiple inventory files by using the -i flag multiple times and providing the file path to each file.

Inside the inventory file, we can group together hosts underneath named groups that we denote by placing the group names into square brackets such as [groupname]. Hosts can appear in more than one group, making these files very flexible. You can also identify a specific port to use, otherwise Ansible will always default to port 22 for SSH. We can then select one or more groups to run our automations on instead of selecting all of the hosts in our inventory file.

 
---
The inventory file can be in one of many formats, depending on the inventory plugins you have. The most common formats are INI and YAML. A basic INI /etc/ansible/hosts might look like this:

    mail.example.com

    [webservers]
    foo.example.com
    bar.example.com

    [dbservers]
    one.example.com
    two.example.com
    three.example.com

The headings in brackets are group names, which are used in classifying hosts and deciding what hosts you are controlling at what times and for what purpose. Group names should follow the same guidelines as Creating valid variable names.

Here’s that same basic inventory file in YAML format:

    all:
    hosts:
        mail.example.com:
    children:
        webservers:
        hosts:
            foo.example.com:
            bar.example.com:
        dbservers:
        hosts:
            one.example.com:
            two.example.com:
            three.example.com:


Adding variables to inventory

You can store variable values that relate to a specific host or group in inventory. To start with, you may add variables directly to the hosts and groups in your main inventory file. As you add more and more managed nodes to your Ansible inventory, however, you will likely want to store variables in separate host and group variable files. See Defining variables in inventory for details.
Assigning a variable to one machine: host variables

You can easily assign a variable to a single host, then use it later in playbooks. \
\
In INI:

    [atlanta]
    host1 http_port=80 maxRequestsPerChild=808
    host2 http_port=303 maxRequestsPerChild=909

In YAML:

    atlanta:
    hosts:
        host1:
        http_port: 80
        maxRequestsPerChild: 808
        host2:
        http_port: 303
        maxRequestsPerChild: 909

Connection variables also work well as host variables:

    [targets]

    localhost              ansible_connection=local
    other1.example.com     ansible_connection=ssh        ansible_user=myuser
    other2.example.com     ansible_connection=ssh        ansible_user=myotheruser

Assigning a variable to many machines: group variables

If all hosts in a group share a variable value, you can apply that variable to an entire group at once. \
\
In INI:

    [atlanta]
    host1
    host2

    [atlanta:vars]
    ntp_server=ntp.atlanta.example.com
    proxy=proxy.atlanta.example.com

In YAML:

    atlanta:
    hosts:
        host1:
        host2:
    vars:
        ntp_server: ntp.atlanta.example.com
        proxy: proxy.atlanta.example.com


---
# Dynamic inventory with AWS


install boto3 \
and botocore \
(pip install boto3, pip install botocore)

## create a file called "aws_ec2.yaml"
    
        (example)
        ---
        plugin: aws_ec2
        keyed_groups:
        - key: tags
            prefix: tag
