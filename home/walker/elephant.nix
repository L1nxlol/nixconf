{ pkgs, config, ... }:

{
  home.activation.linkElephantMenus =
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p $HOME/.config/elephant
      mkdir -p $HOME/.config/elephant/menus  
      ln -sfn $HOME/Nix/home/walker/elephant $HOME/.config/elephant/menus
  '';

  services.elephant = {
    enable = true;
  };
}
