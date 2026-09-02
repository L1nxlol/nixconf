{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    obsidian-extensions = {
      url = "github:karaolidis/nix-obsidian-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    durdraw = {
      url = "github:durdraw/durdraw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, obsidian-extensions, durdraw }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ obsidian-extensions.overlays.default ];
      };

      mkHost = hostFile: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit zen-browser; };
        modules = [
          hostFile
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit zen-browser; };
            nixpkgs.overlays = [ obsidian-extensions.overlays.default ];
          }
        ];
      };
    in
    {
      nixosConfigurations = {
        desktop = mkHost ./hosts/desktop.nix;
        laptop  = mkHost ./hosts/laptop.nix;
      };

      environment.systemPackages = [ durdraw.packages.${system}.default ];  

      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit zen-browser; };
        modules = [ ./home/home.nix ];
      };
    };
}
