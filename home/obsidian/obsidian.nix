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
  vaults."maturaChem".target = "Documents/notes/maturaChem";

  defaultSettings = {
    app.vimMode = true;

    appearance = {
      cssTheme = "Transparent";
      interfaceFontFamily = "GeistMono Nerd Font";
      textFontFamily = "GeistMono Nerd Font";
      monospaceFontFamily = "GeistMono Nerd Font";
    };
  };
};
}
