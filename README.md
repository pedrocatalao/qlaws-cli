# aws-login
Bash script that allows to login to an AWS account and assume roles while staying on the same terminal session (to use within another script).

It supports automatically getting your credentials from Bitwarden.

When you use it just to authenticate in the terminal, it doesn't add much to the existing `aws-vault` except for the Bitwarden integration:
```
radix@cobra:~ » aws-login myproject-aws-profile
┏╾┈
┃ █▀▀█ █   █ █▀▀    █   █▀▀█ █▀▀▀  ●  █▀▀▄
┃ █▄▄█ █▄█▄█ ▀▀█ ▀▀ █   █  █ █ ▀█ ▀█▀ █  █
┃ ▀  ▀  ▀ ▀  ▀▀▀    ▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀▀▀ ▀  ▀
┃ ▬ Bitwarden enabled ✓
┃ ▬ Accessing Bitwarden ✓
┃ ▬ Your keychain password is now on the clipboard ↯
┃ ▬ And here's a 2fa token for AWS vault: 123456
┃ ▬ Enter token for arn:aws:iam::123456789:mfa/pedro.catalao: 123456
┃ ▬ Login successful ✓
┗╾┈
mypersonal-profile-iam@myproject-aws-profile:~ »
```

But when you use it within a script, you can do something like this:
```bash
#!/bin/bash
aws-login --export-only my-personal-iam
source .aws-login.env
terraform apply
echo "server is created..."
aws-login --export-only my-servers-account
source .aws-login.env
ansible-playbook myproject.yml -i myserver.host
echo "my application is installed"
```
And it will login to different accounts (or assume role) and continue the script.
