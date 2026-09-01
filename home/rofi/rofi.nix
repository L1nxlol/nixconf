{ pkgs, config, ... }:

{
  xdg.configFile."rofi" = {
    source = ../rofi;
    recursive = true;
  };
}
