# qlaws-cli ![GitHub Repo stars](https://img.shields.io/github/stars/pedrocatalao/qlaws-cli)

Bash script to facilitate logging in, assuming AWS roles and connecting to EC2 instances.

### Dependencies
* `base32` - install with `brew install coreutils`
* `jq` - install with `brew install jq`

### Features
* Unlocks the aws-vault keychain without user intervention.
* Generates TOTP token for 2FA and uses it automatically.
* Optionally allows to stay in the same session for use within another script that requires changing accounts or roles.
* Option to make the animations run quicker when you're too busy to watch the eye candy stuff. ![New](https://img.shields.io/badge/NEW-green?style=plastic)
* Scrolling text when too big to fit. ![New](https://img.shields.io/badge/NEW-green?style=plastic)
* Option to show and select EC2 instances withing specified iam profile. ![New](https://img.shields.io/badge/NEW-green?style=plastic)
* Option to specify region. ![New](https://img.shields.io/badge/NEW-green?style=plastic)
* Pushes new `SSM-SessionManagerRunShell` document version that specifies SSM starting with `bash`. ![New](https://img.shields.io/badge/NEW-green?style=plastic)
* More eye candy (fading surrounding box and menu). ![New](https://img.shields.io/badge/NEW-green?style=plastic)

### Options
```
Usage: qlaws [-a iam | -c iam] [-r region] [-x] [-h] [-q | -Q]
  -a iam                Assume iam role
  -l iam                List instances on this iam and choose one to connect
  -r region             Specify region
  -x                    Export only (no new shell)
  -q                    Go quicker (less animations)
  -Q                    Go quicker (and store setting)
  -h                    Display help

After logging in:
  loadauth              When in export only mode, loads the credentials into your session.
  assume [role iam]     Assumes a iam role and updates credentials so you can connects.
  connect [hostname]    Connects to a server (assuming you're in the right account).
  leave                 Goes back to parent role (root).
```

### Preview

![preview](docs/qlaws5.gif)

### Notes

If you want to use it within a script to login and assume different roles while staying on the main script without the need for user input, you can do something like this:

```bash
#!/bin/bash
qlaws -x;loadauth
terraform apply
echo "servers are created..."
assume my-first-server-role
ansible-playbook myproject.yml -i my-first-server.host
echo "application is installed on my first server"
leave
assume my-second-server-role
ansible-playbook myproject.yml -i my-second-server.host
echo "application is installed on my second server"
```

