{ config, pkgs, ... }:

{
  home.packages = [ pkgs.neovim pkgs.tree-sitter pkgs.gcc pkgs.lua-language-server ];

  home.activation.linkVim = config.lib.dag.entryAfter ["writeBoundary"] ''
    rm -rf $HOME/.config/nvim-new
    mkdir -p $HOME/.config
    ln -sfn /home/user/Nix/home/vim $HOME/.config/nvim-new
  '';
}

