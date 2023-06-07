USER=serveradmin
HOST_FILE=inventory/nebulousware/hosts.yaml

PLAYBOOK=ANSIBLE_BECOME_PASS=serveradmin ansible-playbook -u $(USER) -i $(HOST_FILE) --become --become-user=root

configure:
	CONFIG_FILE=$(HOST_FILE) python3 contrib/inventory_builder/inventory.py 192.168.1.3 192.168.1.4 192.168.1.5

reset:
	$(PLAYBOOK) reset.yml

deploy:
	$(PLAYBOOK) cluster.yml

