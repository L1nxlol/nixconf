{ pkgs, config, obsidianPlugins, ... }:

{
  imports = [
    ./plugins.nix
    ./settings.nix
  ];

programs.obsidian = {
  enable = true;
  vaults."biol".target = "Documents/notes/biol";
  vaults."chem".target = "Documents/notes/chem";

  defaultSettings = {
    app.vimMode = true;

    appearance = {
      cssTheme = "Transparent";
    };
  };
};
}
