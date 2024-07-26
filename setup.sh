#!/bin/bash

# Prompt for necessary information
read -p "Enter the target server IP or hostname: " server_ip
read -p "Enter the SSH user for the server: " ssh_user
read -p "Enter the new username to create on the server: " new_username
read -p "Enter the timezone for the server (e.g., 'America/New_York'): " timezone
read -s -p "Enter the database password: " db_password
echo
read -p "Include database setup? (y/n): " include_db

# Update inventory.ini
echo "[servers]" >inventory.ini
echo "${server_ip} ansible_user=${ssh_user}" >>inventory.ini

# Update group_vars/all.yml
cat <<EOF >group_vars/all.yml
---
ansible_user: ${ssh_user}
new_username: ${new_username}
timezone: ${timezone}
db_password: ${db_password}
EOF

# Determine which tags to use
if [[ "${include_db}" =~ ^[Yy]$ ]]; then
    tags="common,web,db"
else
    tags="common,web"
fi

# Run the Ansible playbook
ansible-playbook -i inventory.ini server_setup.yml --tags "${tags}"

echo "Setup complete!"
