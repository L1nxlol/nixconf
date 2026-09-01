{ pkgs, config, obsidianPlugins, ... }:

{
programs.obsidian = {
  enable = true;
  vaults."notes".target = "Documents/notes";

  defaultSettings = {
    app.vimMode = true;
    communityPlugins = with pkgs.obsidianPlugins; [
      obsidian-excalidraw-plugin
      chemedit
      obsidian-style-settings
    ];

    themes = [
      { pkg = pkgs.obsidianThemes.transparent; }
    ];
  };
};
}
