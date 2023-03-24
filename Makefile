.DEFAULT_GOAL=update

.PHONY: brew sync add

# If the first argument is "add"...
ifeq (add, $(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

update: settings brew sync

brew:
	@echo "                                 "
	@echo "*********************************"
	@echo "* 🏃 Brew starting	..."
	@echo "*                                 "
	brew bundle install --file setup/Brewfile
	@echo "*                                 "
	@echo "* ✅ Brew completed "
	@echo "*********************************"
	@echo "                                 "

sync:
	@echo "                                 "
	@echo "*********************************"
	@echo "* 🏃 .dotfiles sync starting	..."
	@echo "*                                 "
	rcup -v
	@echo "*                                 "
	@echo "* ✅ .dotfiles sync completed "
	@echo "*********************************"
	@echo "                                 "

settings:
	@echo "                                 "
	@echo "*********************************"
	@echo "* 🏃 Settings update starting	"
	@echo "*                                 "
	setup/system-settings.sh
	@echo "*                                 "
	@echo "* ✅ Settings update completed ..."
	@echo "*********************************"
	@echo "                                 "

add:
	mkrc -v $(RUN_ARGS)

