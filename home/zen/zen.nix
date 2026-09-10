{ pkgs, lib, zen-browser, ... }:

{
  imports = [
    zen-browser.homeModules.beta 
    ./extensions.nix
    ./search.nix
  ];

  programs.zen-browser = {
    enable = true;
    profiles.default = {
      settings = {
        "zen.welcome-screen.seen" = true; #works
        "zen.view.sidebar-expanded" = false; #works
        "zen.view.compact.hide-sidebar" = true; #works
        "zen.view.compact.hide-toolbar" = true; #works
        "zen.urlbar.behavior" = "float";
        "zen.view.experimental-no-window-controls" = true;
        "network.trr.mode" = 3;
        "network.trr.uri" = "https://dns.quad9.net/dns-query";


      };
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
