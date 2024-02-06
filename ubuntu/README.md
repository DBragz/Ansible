# Ubuntu

## Built With

* [Ubuntu](https://ubuntu.com/)

### Configuration on Deployed Machine

1. Boot pi and enable SSH from command line and create pi .ssh folder and authorized_key file.

    ```shell
    mkdir -p /home/username/.ssh/ && touch /home/username/.ssh/authorized_keys
    ```

2. Note pi IP address.

### Configuration for User's Machine using Ansible

1. Install python-apt package for managing external packages.

    ```shell
    sudo apt install python3-apt
    ```

2. Copy the hosts sample file to a real one.

    ```shell
    cp hosts.sample hosts
    ```

3. Add pi IP address to hosts file.

### Test from main ansible orchestrator

  ```shell
  ansible all -i hosts -m ping -u pi
  ```

### Execute

  ```shell
  # List installed packges
  ansible-playbook -i hosts -u pi list.yml
  ```

## Authors

* [Daniel Ribeirinha-Braga](https://github.com/DBragz)
