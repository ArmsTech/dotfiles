.PHONY: dotfiles node osx

dotfiles:
	install/platform/cross/install-dotfiles.sh

node:
	install/platform/cross/install-node.sh

osx:
	$(MAKE) -C dotfiles
	$(MAKE) -C node
