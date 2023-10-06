# echo "secret123" > vault_passwd.sh
ansible-vault create secret.yaml
# New vault password => secret123
# username: alex
# password: qaz321
echo '#!/bin/bash' > vault_passwd.sh
# give permission to the control node to access to the Systems Manager on AWS
echo 'aws --region=us-east-1 ssm get-parameters --names "ans-vault_passwd" --query "Parameters[*].{Value:Value}" --output text' >> vault_passwd.sh
chmod +x vault_passwd.sh
ansible-vault view secret.yaml --vault-password-file ./vault_passwd.sh
ansible-playbook create-user.yaml --vault-password-file ./vault_passwd.sh
ansible all -b -m command -a "grep alex /etc/shadow"