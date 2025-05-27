# Centos

## Built With

* [CentOS](https://www.centos.org/).

### Configuration

1. Boot pi and enable SSH from command line and create pi .ssh folder and authorized_key file.

    ```shell
    mkdir -p /home/username/.ssh/ && touch /home/username/.ssh/authorized_keys
    ```

2. Install python-apt package for managing external packages.

    ```shell
    sudo dnf install python-apt
    ```

3. Note pi IP address.

### Test from main ansible orchestrator

  ```shell
  ansible all -i hosts -m ping -u pi
  ```

### Execute

  ```shell
  # Clean unused packages
  ansible-playbook -i hosts -u pi clean.yml

  # List installed packges
  ansible-playbook -i hosts -u pi list.yml

  # Update all packages
  ansible-playbook -i hosts -u pi update.yml
  ```

## Authors

* [Daniel Ribeirinha-Braga](https://github.com/DBragz)
