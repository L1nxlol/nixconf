{ pkgs, lib, zen-browser, ... }:

{
  programs.zen-browser.policies.ExtensionSettings = {
    "uBlock0@raymondhill.net" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      installation_mode = "force_installed";
    };
  };
}
