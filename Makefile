USER=serveradmin
HOST_FILE=inventory/nebulousware/hosts.yaml

PLAYBOOK=ANSIBLE_BECOME_PASS=serveradmin ansible-playbook -u $(USER) -i $(HOST_FILE) --become --become-user=root

reset:
	$(PLAYBOOK) reset.yml

deploy:
	$(PLAYBOOK) cluster.yml

