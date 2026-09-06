{ config, pkgs, ... }:

let
  hyprglass = pkgs.callPackage ../../cPkgs/hyprglass.nix {
    mkHyprlandPlugin = pkgs.hyprlandPlugins.mkHyprlandPlugin;
  };  
  dynamic-cursors = pkgs.callPackage ../../cPkgs/dynamic-cursors.nix {
    mkHyprlandPlugin = pkgs.hyprlandPlugins.mkHyprlandPlugin;
  };
in
{
  home.activation.linkHyprland =
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      ln -sfn $HOME/Nix/home/hyprland $HOME/.config/hypr

      mkdir -p /home/user/Nix/home/hyprland/plugins
      ln -sfn ${hyprglass}/lib/libhyprglass.so \
        /home/user/Nix/home/hyprland/plugins/hyprglass.so
      '';
}

      # ln -sfn ${dynamic-cursors}/lib/libdynamic-cursors.so \
        # /home/user/Nix/home/hyprland/plugins/dynamic-cursors.so
