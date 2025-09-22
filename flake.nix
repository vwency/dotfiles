{
  description = "Development environment with powerlevel10k";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            zsh
            oh-my-posh
            zsh-powerlevel10k
            neovim
            helix
          ];

          shellHook = ''
            export SHELL=${pkgs.zsh}/bin/zsh
            export ZDOTDIR=$PWD
            
            if [ -f ./.p10k.zsh ]; then
              export P10K_CONFIG_FILE=$PWD/.p10k.zsh
            fi

            echo "Shell ready!"
            
            exec ${pkgs.zsh}/bin/zsh -c "
              source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
              [[ -f \$P10K_CONFIG_FILE ]] && source \$P10K_CONFIG_FILE
              exec ${pkgs.zsh}/bin/zsh
            "
          '';
        };
      });
}
