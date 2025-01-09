---
title: Ansible - Getting Started
date: 2025-01-09 12:20:00 +0200
categories: [Homelab, Automation]
tags: [ansible, iac, automation]     # TAG names should always be lowercase
description: First steps for setting up and using Ansible on a control node to manage server nodes.
toc: false
comments: false
---


## Prerequisites   
- make sure you have access to a Linux environment   
- install Ansible on the control node (your Client)   
- make sure you can SSH into your managed nodes (your servers)   
- on Windows use WSL to install Ansible, there is no version for windows directly   
- Decide between `ansible `(larger package including community collections) and `ansible-core` (minimalist language and runtime package containing a set of built-in modules and plugins)   
   
## Installation   
   
```bash
# Install Ansible release
wsl
sudo apt update && sudo apt upgrade -y
sudo apt install pipx git libffi-dev libssl-dev -y
pipx install ansible-core
pipx ensurepath # add '/home/<user>/.local/bin' to PATH

# Restart WSL
exit
wsl --shutdown
wsl

# Validate Ansible installation
ansible --version
```

## Test Ansible on local host   
```bash
cd ~
# Create .ansible-cfg file
touch .ansible.cfg && sudo nano .ansible.cfg
# Paste the following, save and exit
    [defaults]
    inventory = ~/.ansible-hosts  # used to be hostfile in older versions, but now changed to inventory[defaults]

# Create .ansible-hosts file
touch .ansible-hosts && sudo nano .ansible-hosts
# Paste the following, save and exit
    localhost ansible_connection=local

# Create and run test.yml
touch test.yml && sudo nano test.yml
# Paste the following, save and exit
    ---
    - name: talk to localhost
      hosts: localhost
      connection: local
      gather_facts: no  # stop gathering facts for now
      tasks:
        - name: Print Hello from Ansible
          debug: msg='Hello from Ansible'
    ---


# Run the playbook
ansible-playbook test.yml
```
   
## Set up production environment (on the control node)      
- cd to your project folder   
- create an **Ansible inventory file** called hosts (can be any name)
this file lists the servers you want to communicate with   
   
```
[servers]	# this is an attribute. Can have any name
pve1		# list servers to manage with host name or IP address
pve2
	
```
- optionally: place the hosts file in a "inventory" folder in your project directory   
- to enable password based ssh connection: `sudo apt install sshpass` and add the option `--ask-pass` to the ansible commands (key-based authentication would be preferred)   
- run Ansible command to ping servers
   
   
```bash
# ping all hosts of the inventory file
ansible -i ./inventory/hosts servers -m ping --user <serveradmin> [--ask-pass]

# ping a specific server
ansible all -i <server_address>, -m ping --user <serveradmin> [--ask-pass]
```


## Resources
[https://gist.github.com/Tes3awy/dd73fdf0cd7e650d55a89d254a0005aa](https://gist.github.com/Tes3awy/dd73fdf0cd7e650d55a89d254a0005aa) 

[https://www.youtube.com/watch?v=w9eCU4bGgjQ](https://www.youtube.com/watch?v=w9eCU4bGgjQ) 