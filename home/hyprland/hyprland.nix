{ config, pkgs, ... }:
{
  home.packages = [ pkgs.hyprland ];  # just install the package, no HM module management

  home.activation.linkHyprland = config.lib.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.config/hypr
    ln -sfn /home/user/Nix/home/hyprland/hyprland.lua $HOME/.config/hypr/hyprland.lua
    ln -sfn /home/user/Nix/home/hyprland/style.lua $HOME/.config/hypr/style.lua
    ln -sfn /home/user/Nix/home/hyprland/binds.lua $HOME/.config/hypr/binds.lua
  '';
}
