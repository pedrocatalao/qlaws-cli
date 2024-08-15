# qlaws-cli
### Bash script to facilitate logging in and assuming AWS roles.
* Unlocks the aws-vault keychain without user intervention.
* Generates TOTP token for 2FA and uses it automatically.
* Also allows to stay in the same session for use within another script that requires changing accounts or roles.
* It looks cool, too ;)

![qlaws](docs/qlaws2.gif)

#### If you want to use it within a script, you can do something like this:
```bash
#!/bin/bash
qlaws -x;loadauth
terraform apply
echo "server is created..."
assume my-first-server-role
ansible-playbook myproject.yml -i my-first-server.host
echo "application is installed on my first server"
leave
assume my-second-server-role
ansible-playbook myproject.yml -i my-second-server.host
echo "application is installed on my second server"
```
It will login and assume different roles while staying on the main script without the need for user input.
