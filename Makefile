.PHONY: dotfiles node osx

dotfiles:
	platform/cross/install-dotfiles.sh

node:
	platform/cross/install-node.sh

osx:
	$(MAKE) -C dotfiles
	$(MAKE) -C node
