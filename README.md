# deb-ubuntu-setup

`dev-ubuntu-setup` is a collection of Ansible playbooks for setting up a new
Ubuntu server. It is intended to be used on a fresh Debian or Ubuntu LTS server.

## Getting Started

You can use tags to selectively run parts of the playbook. Here are some
examples:

### Run the entire playbook (excluding reboot)

```yaml
ansible-playbook -i inventory.ini server_setup.yml
```

### Run everything except the db role

```yaml
ansible-playbook -i inventory.ini server_setup.yml --skip-tags "db"
```

### Run only the common and web roles (excluding db)

```yaml
ansible-playbook -i inventory.ini server_setup.yml --tags "common,web"
```

### Run only the db role

```yaml
ansible-playbook -i inventory.ini server_setup.yml --tags "db"
```

### Include the reboot task (which is tagged 'never' by default)

```yaml
ansible-playbook -i inventory.ini server_setup.yml --tags "all,reboot"
```
