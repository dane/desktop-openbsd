.PHONY: *
all: privileged homedir github

packages:
	@echo "The following doas request will run the packages playbook"
	@doas ansible-playbook packages.yaml

cwm:
	@echo "The following doas request will run the cwm playbook"
	@doas ansible-playbook cwm.yaml

rc:
	@echo "The following doas request will run the rc playbook"
	@doas ansible-playbook rc.yaml

github:
	@ansible-playbook github.yaml

homedir:
	@ansible-playbook homedir.yaml

privileged:
	@echo "The following doas request will run playbooks cwm, packages, and rc"
	@doas ansible-playbook packages.yaml cwm.yaml rc.yaml
