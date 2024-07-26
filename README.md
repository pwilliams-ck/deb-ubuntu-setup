# deb-ubuntu-setup

`deb-ubuntu-setup` is an Ansible playbook for setting up a new Debian or Ubuntu
server. It's designed to quickly configure a development environment on a fresh
Debian or Ubuntu LTS server.

## Features

- Configures common system settings
- Installs and sets up web server components
- Optionally configures a PostgreSQL database
- Installs development tools and utilities

## Prerequisites

- Ansible 2.9+ on your local machine
- SSH access to the target Debian/Ubuntu server
- Python 3 on the target server

## Getting Started

### Clone Repository & Run Setup

```bash
git clone https://github.com/pwilliams-ck/deb-ubuntu-setup.git
cd deb-ubuntu-setup
./setup.sh
```

This script will:

- Prompt you for necessary information
- Update the `inventory.ini` file
- Modify `group_vars/all.yml` with your inputs
- Run the Ansible playbook

## Manual Setup

If you prefer to set things up manually:

1. Update `inventory.ini` with your server's IP or hostname.
2. Modify variables in `group_vars/all.yml` as needed.
3. Run the playbook:

```bash
ansible-playbook -i inventory.ini server_setup.yml
```

### Skip DB Setup

```bash
ansible-playbook -i inventory.ini server_setup.yml --skip-tags "db"
```

### Run only Common and Web Server Tasks

```bash
ansible-playbook -i inventory.ini server_setup.yml --tags "common,web"
```

### Include Reboot

```bash
ansible-playbook -i inventory.ini server_setup.yml --tags "all,reboot"
```

## Customization

Modify these files to customize the playbook:

- `roles/common/tasks/main.yml`: Common system setup
- `roles/web/tasks/main.yml`: Web server setup
- `roles/db/tasks/main.yml`: Database setup

## Setup Script

The `setup.sh` script automates the initial configuration. Here's what it does:

1. Prompts for:

   - Target server IP/hostname
   - SSH user
   - New username for the server
   - Timezone
   - Database password
   - Whether to include database setup

2. Updates `inventory.ini` and `group_vars/all.yml` with provided information.

3. Runs the Ansible playbook with appropriate tags.

To use it, simply run:

```bash
./setup.sh
```

### Make Script Executable

```bash
chmod +x setup.sh
```

Follow the prompts to configure and run the playbook.

## Disclaimer

This playbook makes significant changes to the target system. Always test in a
safe environment before using on production servers.
