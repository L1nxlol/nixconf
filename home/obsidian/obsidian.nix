{ pkgs, config, ... }:

{
programs.obsidian = {
  enable = true;
  vaults."notes" = {
    target = "Documents/notes";
    settings = {
      app.vimMode = true;
      communityPlugins = [
        { pkg = pkgs.obsidian-plugins.excalidraw; }
      ];
    };
  };
};
}
