configure:
	CONFIG_FILE=inventory/nebulousware/hosts.yaml python3 contrib/inventory_builder/inventory.py 192.168.1.3 192.168.1.4

reset:
	ANSIBLE_BECOME_PASS=serveradmin ansible-playbook -u serveradmin -i inventory/nebulousware/hosts.yaml --become --become-user=root reset.yml

deploy:
	ANSIBLE_BECOME_PASS=serveradmin ansible-playbook -u serveradmin -i inventory/nebulousware/inventory.ini --become --become-user=root cluster.yml
