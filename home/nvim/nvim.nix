{ config, pkgs, ... }:
{
  home.packages = [ pkgs.neovim pkgs.tree-sitter pkgs.gcc pkgs.lua-language-server ];

  home.activation.linkNvim = config.lib.dag.entryAfter ["writeBoundary"] ''
    rm -rf $HOME/.config/nvim
    mkdir -p $HOME/.config
    ln -sfn /home/user/Nix/home/nvim/nvchad $HOME/.config/nvim
  '';
}
