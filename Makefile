.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ tmux zsh git asdf
	@stow -t ~/.config/nvim nvim
	@stow -t ~/.config/alacritty alacritty

.PHONY: unstow
unstow:
	@stow -D -t ~ tmux zsh git
	@stow -D -t ~/.config/nvim nvim
	@stow -D -t ~/.config/alacritty alacritty
