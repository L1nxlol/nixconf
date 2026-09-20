{ pkgs, lib, zen-browser, ... }:

{
  programs.zen-browser.profiles.default.userChrome = ''
    #PanelUI-menu-button {
      display: none !important;
    }
  '';
}
