.PHONY: linux
linux:
	@stow -t ~ -S linux

.PHONY: mac
mac:
	@stow -t ~ -S mac

.PHONY: nvim
nvim:
	@stow --no-folding -t ~ -S nvim

.PHONY: tmux
tmux:
	@stow --no-folding -t ~ -S tmux
