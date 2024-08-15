# qlaws-cli
### Bash script to facilitate logging in and assuming AWS roles.
* Unlocks the aws-vault keychain without user intervention.
* Generates TOTP token for 2FA and uses it automatically.
* Also allows to stay in the same session for use within another script that requires changing accounts or roles.
* It looks cool, too ;)

![qlaws](docs/qlaws.gif)

#### If you want to use it within a script, you can do something like this:
```bash
#!/bin/bash
qlaws -x
loadauth
terraform apply
echo "server is created..."
assume my-servers-role
ansible-playbook myproject.yml -i myserver.host
echo "my application is installed"
```
It will login or assume roles and continue the main script.
