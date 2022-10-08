# desktop-openbsd

The following configures an OpenBSD installation. Ansible and `doas` are required
to complete the process. `make` will configure xenodm, cwm, install packages,
and setup SSH and GPG keys with GitHub. The `Makefile` contains tasks to
configure each of the topics individually:

- `make cwm`
- `make rc`
- `make packages`
- `make homedir`
- `make github`
