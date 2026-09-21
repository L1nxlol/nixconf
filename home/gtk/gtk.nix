{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Fluent-round-teal-Dark";
      package = (pkgs.fluent-gtk-theme.override {
        themeVariants = [ "teal" ];
        colorVariants = [ "dark" ];
        sizeVariants  = [ "standard" ];
        tweaks        = [ "round" "blur" ];
      }).overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          find $out/share/themes -type f -name '*.css' \
            -exec sed -i 's/rgba(\([0-9]\{1,2\}\), \1, \1, 0\.5)/rgba(0, 0, 0, 0.45)/g' {} +
        '';
      });
    };
    gtk4.theme = config.gtk.theme;
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
