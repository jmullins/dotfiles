.PHONY: linux
linux:
	@stow -t ~ -S linux

.PHONY: nvim
nvim:
	@stow --no-folding -t ~ -S nvim
