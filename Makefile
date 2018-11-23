.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ tmux zsh git tig ruby
	@stow -t ~/.config/nvim nvim

.PHONY: unstow
unstow:
	@stow -D -t ~ tmux zsh git tig ruby
	@stow -D -t ~/.config/nvim nvim
