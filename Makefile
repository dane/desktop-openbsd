.PHONY: *
all: privileged homedir github

deps:
	@echo "The following doas request will install ansible"
	@doas pkg_add ansible

packages:
	@echo "The following doas request will run the packages playbook"
	@doas ansible-playbook packages.yaml

cwm:
	@echo "The following doas request will run the cwm playbook"
	@doas ansible-playbook cwm.yaml

rc:
	@echo "The following doas request will run the rc playbook"
	@doas ansible-playbook rc.yaml

shell:
	@echo "The following doas request will run the shell playbook"
	@doas ansible-playbook shell.yaml

github:
	@ansible-playbook github.yaml

homedir:
	@ansible-playbook homedir.yaml

privileged:
	@echo "The following doas request will run playbooks packages, shell, cwm, and rc"
	@doas ansible-playbook packages.yaml shell.yaml cwm.yaml rc.yaml
