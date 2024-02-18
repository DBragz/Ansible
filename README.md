# Ansible

Setting up Ansible.

## Built With

* [Ansible](https://www.ansible.com/) - Ansible is an open-source software provisioning, configuration management, and application-deployment tool.
* [Docker](https://www.docker.com/) - Is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.
* [SSH](https://www.ssh.com/ssh/?utm_source=s&utm_medium=nav&utm_campaign=head) - Uses encryption to secure the connection between a client and a server.

### On User's Machine using Ansible

1. Copy the hosts sample file to a real one.

    ```shell
    cp hosts.sample hosts
    ```

2. Add pi IP address to hosts file.

3. Generate SSH keys.

    ```shell
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

4. Copy public key of ansible user to remote machine.

    ```shell
    cat ~/.ssh/id_rsa.pub | ssh username@ip_address 'cat >> ~/.ssh/authorized_keys'
    ```

### On User's Machine using Docker

1. Run ansible container

    ```shell
    docker run --rm -it -v your_directory_location:/ansible willhallonline/ansible:latest /bin/sh
    ```

2. Generate SSH keys.

    ```shell
    ssh-keygen -t rsa -b 4096 -C username@email.com
    ```

3. Send SSH keys to server.

    ```shell
    cat ~/.ssh/id_rsa.pub | ssh username@server "cat >> ~/.ssh/authorized_keys"
    ```

### Test

  ```shell
  ansible all -i hosts -m ping -u username
  ```

## Authors

* [Daniel Ribeirinha-Braga](https://github.com/DBragz)
