gitexecdir = ${shell git --exec-path}

-include ./config.mak

ifndef SHELL_PATH
	SHELL_PATH = /bin/sh
endif

SHELL_PATH_SQ = $(subst ','\'',$(SHELL_PATH))
gitexecdir_SQ = $(subst ','\'',$(gitexecdir))

SCRIPT=git-latexdiff

.PHONY: install help
help:
	@echo 'This is the help target of the Makefile. Current configuration:'
	@echo '  gitexecdir = $(gitexecdir_SQ)'
	@echo '  SHELL_PATH = $(SHELL_PATH_SQ)'
	@echo 'Run "$(MAKE) install" to install $(SCRIPT) in gitexecdir.'

install:
	sed -e '1s|#!.*/sh|#!$(SHELL_PATH_SQ)|' $(SCRIPT) > '$(gitexecdir_SQ)/$(SCRIPT)'
	chmod 755 '$(gitexecdir)/$(SCRIPT)'
