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

    mkdir -p ~/.ssh/ && touch ~/.ssh/authorized_keys
    ```

2. Note pi IP address.

### Authorize Remote Machine

1. Generate an SSH key.

2. Push generated key to pi.

   ```shell
   cat ~/.ssh/id_rsa.pub | ssh user@hostname 'cat >> ~/.ssh/authorized_keys'

   # You will be then prompted to provide a password
   user@hostname's password:
   ```

### Test from main ansible orchestrator

1. Copy the `hosts.sample` file to a file called `hosts`.

   ```shell
   cp hosts.sample hosts
   ```

2. Update IP address and ansible user name.

3. Test connection.

   ```shell
   ansible all -i hosts -m ping -u pi

   pi_ip_address | SUCCESS => {
       "ansible_facts": {
      "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
   }
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
