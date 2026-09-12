{ pkgs, lib, zen-browser, ... }:

{
  programs.zen-browser.policies.ExtensionSettings = {
    "uBlock0@raymondhill.net" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      installation_mode = "force_installed";
    };

    "sponsorBlocker@ajay.app" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
    installation_mode = "force_installed";
    };

    "jid1-MnnxcxisBPnSXQ@jetpack" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
      installation_mode = "force_installed";
    };

    "addon@darkreader.org" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
      installation_mode = "force_installed";
    };

    "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
      installation_mode = "force_installed";
    };

    "762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/return_youtube_dislikes/latest.xpi";
      installation_mode = "force_installed";
    };
  };
}
