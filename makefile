USER=serveradmin
BECOME_PASS=serveradmin
HOST_FILE=inventory/nebulousware/hosts.yaml

PLAYBOOK=ANSIBLE_BECOME_PASS=serveradmin ansible-playbook -u $(USER) -i $(HOST_FILE) --become --become-user=root

import:
	@if [ "$(NODE)" = "" ]; then \
		echo "make $@ requires an argument of NODE=<control-plane-node>."; \
		exit 1; \
	fi

	echo $(BECOME_PASS) | ssh -qtt serveradmin@$(NODE) sudo cat /etc/kubernetes/admin.conf | sed 's/127.0.0.1/$(NODE)/' | tail -n +3 > ~/.kube/config

import-config: import

prepare:
	$(PLAYBOOK) prepare-nodes.yml

reset:
	$(PLAYBOOK) reset.yml

deploy:
	$(PLAYBOOK) cluster.yml

