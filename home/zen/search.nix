{pkgs, ...}: 

{
  programs.zen-browser.profiles.default.search = {
    force = true; # Enforce declared search engines on each rebuild

    default = "ddg";

    engines = {
      mynixos = {
        name = "My NixOS";
        urls = [
          {
            template = "https://mynixos.com/search?q={searchTerms}";
            params = [{
              name = "query";
              value = "searchTerms";
            }];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = ["@nx"];
      }; 

      nixpkgs = {
        name = "Nix Pkgs";
        urls = [{
          template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
        }];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = ["@np"];
      };

      github = {
        name = "GitHub Search";
        urls = [{
          template = "https://github.com/search?q={searchTerms}";
        }];
        definedAliases = ["@gh"];
      };
    };
  };
}
