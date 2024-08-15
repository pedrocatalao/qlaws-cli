# aws-login
Bash script that allows to login to an AWS account and assume roles while staying on the same terminal session (to use within another script).

It unlocks the aws-vault keychain without user intervention.

Also generates TOTP token for 2FA and uses it automatically.

It looks cool :)

![Example](docs/qlaws.gif)



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
And it will login to different accounts (or assume role) and continue the script.
