.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ tmux zsh git tig ruby
	@stow -t ~/.config/nvim nvim
	@stow -t ~/.ssh ssh
	@stow -t ~/.config/alacritty alacritty

.PHONY: unstow
unstow:
	@stow -D -t ~ tmux zsh git tig ruby
	@stow -D -t ~/.config/nvim nvim
	@stow -D -t ~/.ssh ssh
	@stow -D -t ~/.config/alacritty alacritty
