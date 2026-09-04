{ pkgs, config, obsidianPlugins, ... }:

{
  imports = [
    ./plugins.nix
    ./settings.nix
  ];

programs.obsidian = {
  enable = true;
  vaults."notes".target = "Documents/notes";

  defaultSettings = {
    app.vimMode = true;

    appearance = {
      cssTheme = "Transparent";
    };
  };
};
}
