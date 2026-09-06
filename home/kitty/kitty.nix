{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "GeistMono Nerd Font Mono";
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

      symbol_map = "U+e000-U+f8ff Symbols Nerd Font Mono";
    };
  };
}
