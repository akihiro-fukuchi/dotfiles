xcode: ## install Command Line Tools
	xcode-select --install

brew: ## install brew https://brew.sh/
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install: ## install OSX packages
	brew bundle --file=~/.brewfile

zsh: ## default shell zsh
	sudo sh -c ‘echo /usr/local/bin/zsh >> /etc/shells’
	chsh -s /usr/local/bin/zsh

link: ## create link for git controlled configure files.
	ln -s $(PWD)/.brewfile $(HOME)/.brewfile
	ln -s $(PWD)/.gitconfig $(HOME)/.gitconfig
	ln -s $(PWD)/.gitignore $(HOME)/.gitignore
	ln -s $(PWD)/.tmux.conf $(HOME)/.tmux.conf
	ln -s $(PWD)/.vimrc $(HOME)/.vimrc
	ln -s $(PWD)/.zshrc $(HOME)/.zshrc
	mkdir -p $(HOME)/.config
	ln -s $(PWD)/.config/karabiner $(HOME)/.config/karabiner


tmux-cssh: ## install tmux-cssh https://github.com/peikk0/tmux-cssh
	curl -sSLO https://raw.githubusercontent.com/peikk0/tmux-cssh/master/tmux-cssh
	chmod +x tmux-cssh
	mv tmux-cssh /usr/local/bin/tmux-cssh

kube-tmux: ## install kube-tmux https://github.com/jonmosco/kube-tmux
	git clone https://github.com/jonmosco/kube-tmux.git
	mkdir -p $(HOME)/.tmux
	mv kube-tmux $(HOME)/.tmux/kube-tmux

defaults: ## defaults configure for OSX
	# Dock for nothing
	defaults write com.apple.dock persistent-apps -array
	# init key repeat. normal minimum is 15 (225 ms)
	defaults write -g InitialKeyRepeat -int 12
	# key repeat. normal minimum is 2 (30 ms)
	defaults write -g KeyRepeat -int 1
	# Other Settings
	# - sleep when cursor to right top
	# - user launch apps
	# - icloud
	# - enable Google japanese inputs
	# - disable auto completion in keyboards

apps: ## application settings
	# Better Touch Tools
	# - shift + cursor/CMD + cursor
	# Alfred
	# - key to CMD + SPACE

help:
	@grep -E '^[a-zA-Z0-9_-]+%?:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

