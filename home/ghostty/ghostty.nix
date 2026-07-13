{ config, pkgs, ... }:
{
  xdg.configFile."ghostty/config.ghostty".source = ./ghostty.conf;
}
