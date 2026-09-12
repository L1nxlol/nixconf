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

        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","ublock0_raymondhill_net-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","idcac-pub_guus_ninja-browser-action","_830f38bd-efc5-45dc-a5a6-064d9a638806_-browser-action","_4b7825da-0dd1-44f9-9717-bee5b2408af6_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","ai-window-toggle"],"vertical-tabs":[],"PersonalToolbar":["import-button","personal-bookmarks"],"zen-sidebar-top-buttons":["zen-toggle-compact-mode"],"zen-sidebar-foot-buttons":["downloads-button","zen-workspaces-button","zen-create-new-button"]},"seen":["developer-button","screenshot-button","ublock0_raymondhill_net-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","sponsorblocker_ajay_app-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","idcac-pub_guus_ninja-browser-action","_830f38bd-efc5-45dc-a5a6-064d9a638806_-browser-action","ai-window-toggle","_4b7825da-0dd1-44f9-9717-bee5b2408af6_-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","zen-sidebar-foot-buttons","unified-extensions-area","toolbar-menubar","TabsToolbar","PersonalToolbar","zen-sidebar-top-buttons"],"currentVersion":26,"newElementCount":3}'';
      };

      mods = [ # to the future me, sorry
        "e122b5d9-d385-4bf8-9971-e137809097d0"
        "79dde383-4fe7-404a-a8e6-9be440022542"
        "1b88a6d1-d931-45e8-b6c3-bfdca2c7e9d6"
        "906c6915-5677-48ff-9bfc-096a02a72379"
        "f7c71d9a-bce2-420f-ae44-a64bd92975ab"
        "a6335949-4465-4b71-926c-4a52d34bc9c0"
        "bc25808c-a012-4c0d-ad9a-aa86be616019"
      ];
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
