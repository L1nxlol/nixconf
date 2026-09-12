{ pkgs, config, ... }:

{
  home.activation.linkElephantMenus =
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      ln -sfn $HOME/Nix/home/walker/elephant $HOME/.config/elephant/menus
  '';

  services.elephant = {
    enable = true;
  };
}
