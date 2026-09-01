{ pkgs, config, ... }:

{
  xdg.configFile."foldername" = {
    source = ./path/to/folder;
    recursive = true;
  };
}
