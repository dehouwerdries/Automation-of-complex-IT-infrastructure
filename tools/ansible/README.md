# How to run
Run the 'terraform init' and 'terraform apply -auto-approve -lock=false' command to deploy the infrastructure.

Copy the 'sshKeys/ansible-key' and the 'sshKeys/ansible-key.pub' to the '~/.ssh/' folder.

Wait a minute or two and then run the 'ansible-playbook -i hosts installApp.yml' command to run the playbook.

Note, use the 'ssh-keygen -f ~/.ssh/known_hosts -R [ip]' command when you get an error message about the ssh key when executing the ansible playbook. This occurs when the compute engine has the same ip as a previous connection.