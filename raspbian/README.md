# Raspbian

## Built With

* [Raspbian](https://www.raspberrypi.com/software/)

### Configuration

#### Raspberry Pi: Enable SSH Option #1

1. In boot partition of SD card add the following file name.

    ```shell
    ssh
    ```

#### Raspberry Pi: Enable SSH Option #2

1. Boot pi and enable SSH from command line and create pi .ssh folder and authorized_key file.

    ```shell
    sudo raspi-config

    # Interfacing Options -> SSH -> Yes

    mkdir -p /home/pi/.ssh/ && touch /home/pi/.ssh/authorized_keys
    ```

2. Install python-apt package for managing external packages.

    ```shell
    sudo apt install python-apt
    ```

3. Note pi IP address.

### Test from main ansible orchestrator

  ```shell
  ansible all -i hosts -m ping -u pi
  ```

### Execute

  ```shell
  # Purge LibreOffice and Wolfram Engine
  ansible-playbook -i hosts -u pi purge.yml

  # Autoremove and autoclean
  ansible-playbook -i hosts -u pi clean.yml
  ```

## Authors

* [Daniel Ribeirinha-Braga](https://github.com/DBragz)
