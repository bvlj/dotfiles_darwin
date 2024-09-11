bunny:
	NIX_CONFIG="access-tokens = github.com=${GH_TOKEN}" \
		nix build .#darwinConfigurations.boring-bunny.system \
			--extra-experimental-features 'nix-command flakes'
	./result/sw/bin/darwin-rebuild switch --flake .#boring-bunny

hare:
	NIX_CONFIG="access-tokens = github.com=${GH_TOKEN}" \
		nix build .#darwinConfigurations.hyperbolic-hare.system \
			--extra-experimental-features 'nix-command flakes'
	./result/sw/bin/darwin-rebuild switch --flake .#hyperbolic-hare
