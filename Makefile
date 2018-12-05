LINKS = vimrc tmux.conf bash_profile bashrc profile ackrc vim gitignore inputrc psqlrc jshintrc gemrc config/liquidpromptrc config/nvim config/ranger/commands.py config/ranger/commands_full.py config/ranger/rc.conf config/ranger/rifle.conf config/ranger/scope.sh
ENVSUBST = $(shell which envsubst || (find /usr/local -name envsubst | head -n 1))
HOSTNAME = $(shell hostname -s)

.PHONY: install
install: backup $(addprefix ~/.,$(LINKS)) ~/.gitconfig

$(addprefix ~/.,$(LINKS)):
	@mkdir -p $(@D)
	ln -s $(CURDIR)/$(@F:.%=%) $@

~/.gitconfig:
ifndef NAME
	$(error NAME is undefined (your real name))
endif
ifndef EMAIL
	$(error EMAIL is undefined (your email))
endif
ifndef GITHUB
	$(error GITHUB is undefined (your GitHub user name))
endif
ifndef GPGKEY
	$(error GPGKEY is undefined (your GPG key id))
endif
ifndef HOME
	$(error HOME is undefined (your home dir path))
endif
	mv $@ $@~ 2>/dev/null || true
	$(ENVSUBST) \$$NAME,\$$EMAIL,\$$GITHUB,\$$GPGKEY,\$$HOME < $(@F:.%=%) > $@

backup: $(addprefix ~/.,$(addsuffix ~,$(LINKS)))

$(addprefix ~/.,$(addsuffix ~,$(LINKS))):
	[ -L $(@:%~=%) ] || (mv $(@:%~=%) $@ 2>/dev/null) || true

brew:
	brew update
	brew upgrade
	brew bundle install --file=Brewfile.$(HOSTNAME)
	brew bundle cleanup --file=Brewfile.$(HOSTNAME)
	brew cleanup
	mas upgrade
