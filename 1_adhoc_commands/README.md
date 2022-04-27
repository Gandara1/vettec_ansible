# Ansible Ad Hoc

## It's time to start getting our hands on Ansible and see how it works. We will start by running singular commands known as Ad Hoc commands. 

Ad Hoc commands are meant for running tasks you don't need to repeat. For example, if you needed to turn off all of your servers during a holiday, you could execute a simple single line in Ansible without writing a playbook. Ad hoc commands have this syntax:

    $ ansible [host] -m [module] -a "[module options]"

    

Keep in mind - you need to identify the host that you would like to run the ad hoc command on. Right now, our host is localhost.

After running your ad hoc commands, Ansible will provide output that describes what has changed. If you want extra output when running your commands to gain some additional insight, you can use the -v flag to request a verbose response. If you want even more information, you can add additional "v's" in the verbose flag - for example: -vvvv. You can pass up to 4 v's in the verbose flag, each v adding more output.

Example command:

    ansible localhost -m file -a "path=./testing.txt state=touch"
    ansible localhost -m file -a "path=./new_folder state=directory"
    ansible localhost -m lineinfile -a "path=./testing.txt line='The cat in the hat'"
    ansible localhost -m replace -a "path=./testing.txt regexp=cat replace=dog"
    ansible localhost -m copy -a "src=./testing.txt dest=./new_folder"
