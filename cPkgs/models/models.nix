{ nix-hug, system }:

let
  lib = nix-hug.lib.${system};

  my-model = lib.fetchModel {
    repoId = "some/model";
    rev = "...";
    fileTreeHash = "sha256-...";
    gitRepoHash = "sha256-...";
  };
in
  lib.buildCache {
    models = [ my-model ];
  }
