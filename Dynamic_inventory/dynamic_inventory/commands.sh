sudo yum install pip
pip install --user boto3 botocore
# Assign the role of 'AmazonEC2FullAccess' to the control node to work with a dynamic invetory
ansible-inventory -i inventory_aws_ec2.yml --graph
ansible-inventory --graph # No difference, inventory path has been configured in the config file
ansible centos -m shell -a "grep lisa /etc/passwd"
ansible debian -e ansible_user=ubuntu -m shell -a "grep lisa /etc/passwd"