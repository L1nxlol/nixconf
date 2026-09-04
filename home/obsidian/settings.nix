{ pkgs, config, obsidianPlugins, ... }:

{
  programs.obsidian.defaultSettings = {
    app = {
      showLineNumber = true;
      showInlineTitle = false;
      confirmFileDeletion = false;
      deletedFiles = "trash";
      spellcheck = true;
      spellcheckLanguages = [
        "pl"
        "en-US"
      ];
    };

    appearance = {
      accentColor = "#ffffff";
    };
  };
}
