.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ tmux zsh git ruby ripgrep
	@stow -t ~/.config/nvim nvim
	@stow -t ~/.config/alacritty alacritty

.PHONY: unstow
unstow:
	@stow -D -t ~ tmux zsh git ruby ripgrep
	@stow -D -t ~/.config/nvim nvim
	@stow -D -t ~/.config/alacritty alacritty
