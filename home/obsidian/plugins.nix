{ pkgs, config, obsidianPlugins, ... }:

{
  programs.obsidian.defaultSettings = {

    communityPlugins = with pkgs.obsidianPlugins; [
      obsidian-excalidraw-plugin
      chemedit
      obsidian-style-settings
    ];

    themes = [
      { pkg = pkgs.obsidianThemes.transparent; }
    ];

  corePlugins = [
  "backlink"
  "bases"
  "bookmarks"
  "canvas"
  "command-palette"
  "daily-notes"
  "editor-status"
  "file-explorer"
  "file-recovery"
  "global-search"
  "graph"
  "note-composer"
  "outgoing-link"
  "outline"
  "page-preview"
  "properties"
  "switcher"
  "sync"
  "tag-pane"
  "templates"
  "word-count"
  ];
  };
}
