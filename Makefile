LINKS = vimrc tmux.conf bash_profile bashrc profile ackrc vim gitignore inputrc psqlrc jshintrc gemrc config/liquidpromptrc config/nvim config/ranger/commands.py config/ranger/commands_full.py config/ranger/rc.conf config/ranger/rifle.conf config/ranger/scope.sh

.PHONY: install
install: $(addprefix ~/.,$(LINKS))

$(addprefix ~/.,$(LINKS)):
	mkdir -p $(@D)
	ln -sf $(CURDIR)/$(@F:.%=%) $@
