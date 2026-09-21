{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Fluent-round-Dark";
      package = pkgs.fluent-gtk-theme.override {
        themeVariants = [ "teal" ];
        colorVariants = [ "dark" ];
        sizeVariants  = [ "standard" ];
        tweaks        = [ "round" "blur" ];
      };
    };
  };
}
