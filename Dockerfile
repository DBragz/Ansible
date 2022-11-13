FROM willhallonline/ansible:latest

ARG email 
ARG username
ARG hostname

RUN if[[ -z "$email" ] || [ -z "$username" ] || [ -z "$hostname" ]]; then echo -e "Error: Parameters missing\nUsage: Dockerfile.ansible [email] [username] [hostname]" ; exit 0 ; fi

RUN ssh-keygen -t rsa -b rsa -b 4096 -C email

RUN cat ~/.ssh/id_rsa.pub | ssh username@hostname "cat >> ~/.ssh/authorized_keys"
