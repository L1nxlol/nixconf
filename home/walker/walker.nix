{ inputs, pkgs, config, ... }:

{  
  imports = [ inputs.walker.homeManagerModules.default ];

  services.walker = {
    enable = true;
    runAsService = true;

    settings = {
      hotreload_theme = false;
      force_keyboard_focus = true;
      close_when_open = true;

      search.placeholder = "Search";

      providers.prexixes = [
        { prefix = "/"; provider = "files"; }
        { prefix = "="; provider = "calc"; }
      ];
    };
  };

  home.activation.linkWalkerTheme = config.lib.dag.entryAfter ["writeBoundary"] ''
    ln -sfn ${config.home.homeDirectory}/Nix/home/walker/theme.css \
    ${config.home.homeDirectory}/.config/walker/themes/default.css
  '';
}
