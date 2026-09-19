{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "Geist Mono";
      size = 10;
    };

    settings = {
      background_opacity = 0.6;
      confirm_os_window_close = 0;
      scrollbar_handle_opacity = 0; 
      scrollbar_track_opacity = 0;

      cursor_shape = "beam";
      cursor_trail = 1;
      cursor_trail_decay = "0.1  0.3";

      symbol_map = "U+e000-U+f8ff,U+f0000-U+f1af0 Symbols Nerd Font Mono";
      font_features = "GeistMono-Regular +ss11";
      disable_ligatures = "never";
    };
  };
}
