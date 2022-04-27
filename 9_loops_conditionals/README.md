# Loops

Ansible offers the loop, with_lookup, and until keywords to execute a task multiple times. Examples of commonly-used loops include changing ownership on several files and/or directories with the file module, creating multiple users with the user module, and repeating a polling step until a certain result is reached.

Standard loops

Iterating over a simple list

Repeated tasks can be written as standard loops over a simple list of strings. You can define the list directly in the task.

    - name: Add several users
      ansible.builtin.user:
        name: "{{ item }}"
        state: present
        groups: "wheel"
      loop:
        - testuser1
        - testuser2

You can define the list in a variables file, or in the ‘vars’ section of your play, then refer to the name of the list in the task.

    loop: "{{ somelist }}"

Either of these examples would be the equivalent of

    - name: Add user testuser1
      ansible.builtin.user:
        name: "testuser1"
        state: present
        groups: "wheel"

    - name: Add user testuser2
      ansible.builtin.user:
        name: "testuser2"
        state: present
        groups: "wheel"

You can pass a list directly to a parameter for some plugins. Most of the packaging modules, like yum and apt, have this capability. When available, passing the list to a parameter is better than looping over the task. For example

    - name: Optimal yum
      ansible.builtin.yum:
        name: "{{ list_of_packages }}"
        state: present

    - name: Non-optimal yum, slower and may cause issues with interdependencies
      ansible.builtin.yum:
        name: "{{ item }}"
        state: present
      loop: "{{ list_of_packages }}"

Check the module documentation to see if you can pass a list to any particular module’s parameter(s).
Iterating over a list of hashes

If you have a list of hashes, you can reference subkeys in a loop. For example:

    - name: Add several users
      ansible.builtin.user:
        name: "{{ item.name }}"
        state: present
        groups: "{{ item.groups }}"
      loop:
        - { name: 'testuser1', groups: 'wheel' }
        - { name: 'testuser2', groups: 'root' }

When combining conditionals with a loop, the when: statement is processed separately for each item. See Basic conditionals with when for examples.
Iterating over a dictionary

To loop over a dict, use the dict2items:

    - name: Using dict2items
      ansible.builtin.debug:
        msg: "{{ item.key }} - {{ item.value }}"
      loop: "{{ tag_data | dict2items }}"
      vars:
        tag_data:
          Environment: dev
          Application: payment

Here, we are iterating over tag_data and printing the key and the value from it.
Registering variables with a loop

You can register the output of a loop as a variable. For example

    - name: Register loop output as a variable
      ansible.builtin.shell: "echo {{ item }}"
      loop:
        - "one"
        - "two"
      register: echo

When you use register with a loop, the data structure placed in the variable will contain a results attribute that is a list of all responses from the module. This differs from the data structure returned when using register without a loop.

    {
        "changed": true,
        "msg": "All items completed",
        "results": [
            {
                "changed": true,
                "cmd": "echo \"one\" ",
                "delta": "0:00:00.003110",
                "end": "2013-12-19 12:00:05.187153",
                "invocation": {
                    "module_args": "echo \"one\"",
                    "module_name": "shell"
                },
                "item": "one",
                "rc": 0,
                "start": "2013-12-19 12:00:05.184043",
                "stderr": "",
                "stdout": "one"
            },
            {
                "changed": true,
                "cmd": "echo \"two\" ",
                "delta": "0:00:00.002920",
                "end": "2013-12-19 12:00:05.245502",
                "invocation": {
                    "module_args": "echo \"two\"",
                    "module_name": "shell"
                },
                "item": "two",
                "rc": 0,
                "start": "2013-12-19 12:00:05.242582",
                "stderr": "",
                "stdout": "two"
            }
        ]
    }

Subsequent loops over the registered variable to inspect the results may look like

    - name: Fail if return code is not 0
      ansible.builtin.fail:
        msg: "The command ({{ item.cmd }}) did not have a 0 return code"
      when: item.rc != 0
      loop: "{{ echo.results }}"

During iteration, the result of the current item will be placed in the variable.

    - name: Place the result of the current item in the variable
      ansible.builtin.shell: echo "{{ item }}"
      loop:
        - one
        - two
      register: echo
      changed_when: echo.stdout != "one"

