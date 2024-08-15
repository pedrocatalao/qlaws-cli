# ql-aws
Bash script to facilitate logging in and assuming AWS roles.
It unlocks the aws-vault keychain without user intervention.
Also generates TOTP token for 2FA and uses it automatically.
It also allows to stay in the same session for use within another script that requires changing accounts or roles.
It looks cool :)

![ql-aws](docs/qlaws.gif)

If you want to use it within a script, you can do something like this:
```bash
#!/bin/bash
ql-aws -x
ql-load
terraform apply
echo "server is created..."
ql-aws -x -a my-servers-role
ql-load
ansible-playbook myproject.yml -i myserver.host
echo "my application is installed"
```
It will login or assume roles and continue the main script.
