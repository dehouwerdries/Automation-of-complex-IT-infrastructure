# Ansible infrastructure deployment
## How to run
Deploy the infrastructure on GCP.

    ansible-playbook deployInfra.yml

Remove the infrastructure on GCP:

    ansible-playbook deleteInfra.yml

Note: 
- Change the database name in both files when the database is deleted often.
- SSH still needs configuring to run playbooks on the remote compute instance.
- Playbooks can be run on the remote compute instance by specifying the 'appserver' group as hosts in a playbook (ssh needs to be configured before this is possible).

## Prerequisites
Install the 'google.cloud' collection if the collection isn't allready installed. This can be done by using the command below.

    ansible-galaxy collection install google.cloud

Install the requests and google-auth libraries using pip.

    pip install requests google-auth

Create a google service account, add a key and download the json file. Rename it to 'servicefile.json' and put it in this folder.