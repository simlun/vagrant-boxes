BASENAME := precise32-simlun
DATE := $(shell date +%Y%m%d)
VERSION := $(DATE)
BOX_FILE_NAME := dist/$(BASENAME)-$(VERSION).box
SYMLINK_NAME := $(BASENAME)-latest
LATEST_BOX_SYMLINK := dist/$(SYMLINK_NAME).box
MANIFESTS := $(shell find manifests -name '*.pp')


.PHONY: box
box: $(BOX_FILE_NAME)

dist:
	mkdir dist

$(BOX_FILE_NAME): Vagrantfile $(MANIFESTS) bootstrap.sh | dist
	vagrant destroy --force
	vagrant up --no-provision
	vagrant vbguest
	vagrant reload --provision
	vagrant vbguest
	vagrant halt
	vagrant package --output $(BOX_FILE_NAME)
	ln -f $(BOX_FILE_NAME) $(LATEST_BOX_SYMLINK)
	vagrant box add $(SYMLINK_NAME) $(LATEST_BOX_SYMLINK) --force

.PHONY: clean
clean:
	rm -rf dist
	vagrant destroy --force
	rm -rf .vagrant
