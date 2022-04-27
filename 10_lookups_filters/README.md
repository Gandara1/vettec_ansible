# Using filters to manipulate data

Filters let you transform JSON data into YAML data, split a URL to extract the hostname, get the SHA1 hash of a string, add or multiply integers, and much more. You can use the Ansible-specific filters documented here to manipulate your data, or use any of the standard filters shipped with Jinja2 - see the list of built-in filters in the official Jinja2 template documentation. You can also use Python methods to transform data. You can create custom Ansible filters as plugins, though we generally welcome new filters into the ansible-core repo so everyone can use them.

Because templating happens on the Ansible controller, not on the target host, filters execute on the controller and transform data locally.


Handling undefined variables

Filters can help you manage missing or undefined variables by providing defaults or making some variables optional. If you configure Ansible to ignore most undefined variables, you can mark some variables as requiring values with the mandatory filter.
Providing default values

You can provide default values for variables directly in your templates using the Jinja2 ‘default’ filter. This is often a better approach than failing if a variable is not defined:

{{ some_variable | default(5) }}

In the above example, if the variable ‘some_variable’ is not defined, Ansible uses the default value 5, rather than raising an “undefined variable” error and failing. If you are working within a role, you can also add a defaults/main.yml to define the default values for variables in your role.

Beginning in version 2.8, attempting to access an attribute of an Undefined value in Jinja will return another Undefined value, rather than throwing an error immediately. This means that you can now simply use a default with a value in a nested data structure (in other words, {{ foo.bar.baz | default('DEFAULT') }}) when you do not know if the intermediate values are defined.

If you want to use the default value when variables evaluate to false or an empty string you have to set the second parameter to true:

{{ lookup('env', 'MY_USER') | default('admin', true) }}

Making variables optional

By default Ansible requires values for all variables in a templated expression. However, you can make specific variables optional. For example, you might want to use a system default for some items and control the value for others. To make a variable optional, set the default value to the special variable omit:

- name: Touch files with an optional mode
  ansible.builtin.file:
    dest: "{{ item.path }}"
    state: touch
    mode: "{{ item.mode | default(omit) }}"
  loop:
    - path: /tmp/foo
    - path: /tmp/bar
    - path: /tmp/baz
      mode: "0444"

In this example, the default mode for the files /tmp/foo and /tmp/bar is determined by the umask of the system. Ansible does not send a value for mode. Only the third file, /tmp/baz, receives the mode=0444 option.

    Note

    If you are “chaining” additional filters after the default(omit) filter, you should instead do something like this: "{{ foo | default(None) | some_filter or omit }}". In this example, the default None (Python null) value will cause the later filters to fail, which will trigger the or omit portion of the logic. Using omit in this manner is very specific to the later filters you are chaining though, so be prepared for some trial and error if you do this.

## Defining mandatory values

If you configure Ansible to ignore undefined variables, you may want to define some values as mandatory. By default, Ansible fails if a variable in your playbook or command is undefined. You can configure Ansible to allow undefined variables by setting DEFAULT_UNDEFINED_VAR_BEHAVIOR to false. In that case, you may want to require some variables to be defined. You can do this with:

    {{ variable | mandatory }}

The variable value will be used as is, but the template evaluation will raise an error if it is undefined.

A convenient way of requiring a variable to be overridden is to give it an undefined value using the undef keyword. This can be useful in a role’s defaults.

    galaxy_url: "https://galaxy.ansible.com"
    galaxy_api_key: {{ undef(hint="You must specify your Galaxy API key") }}

Defining different values for true/false/null (ternary)

You can create a test, then define one value to use when the test returns true and another when the test returns false (new in version 1.9):

    {{ (status == 'needs_restart') | ternary('restart', 'continue') }}

In addition, you can define a one value to use on true, one value on false and a third value on null (new in version 2.8):

    {{ enabled | ternary('no shutdown', 'shutdown', omit) }}

Managing data types

You might need to know, change, or set the data type on a variable. For example, a registered variable might contain a dictionary when your next task needs a list, or a user prompt might return a string when your playbook needs a boolean value. Use the type_debug, dict2items, and items2dict filters to manage data types. You can also use the data type itself to cast a value as a specific data type.
Discovering the data type

New in version 2.3.

If you are unsure of the underlying Python type of a variable, you can use the type_debug filter to display it. This is useful in debugging when you need a particular type of variable:

    {{ myvar | type_debug }}

Transforming dictionaries into lists

New in version 2.6.

Use the dict2items filter to transform a dictionary into a list of items suitable for looping:

    {{ dict | dict2items }}

Dictionary data (before applying the dict2items filter):

    tags:
    Application: payment
    Environment: dev

List data (after applying the dict2items filter):

  - key: Application
    value: payment
  - key: Environment
    value: dev

New in version 2.8.

The dict2items filter is the reverse of the items2dict filter.

If you want to configure the names of the keys, the dict2items filter accepts 2 keyword arguments. Pass the key_name and value_name arguments to configure the names of the keys in the list output:

    {{ files | dict2items(key_name='file', value_name='path') }}

Dictionary data (before applying the dict2items filter):

    files:
    users: /etc/passwd
    groups: /etc/group

List data (after applying the dict2items filter):

  - file: users
    path: /etc/passwd
  - file: groups
    path: /etc/group

Transforming lists into dictionaries

New in version 2.7.

Use the items2dict filter to transform a list into a dictionary, mapping the content into key: value pairs:

    {{ tags | items2dict }}

List data (before applying the items2dict filter):

    tags:
    - key: Application
        value: payment
    - key: Environment
        value: dev

Dictionary data (after applying the items2dict filter):

    Application: payment
    Environment: dev

