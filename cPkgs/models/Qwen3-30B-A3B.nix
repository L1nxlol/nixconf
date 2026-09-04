{ nix-hug, system }:

let
  lib = nix-hug.lib.${system};
in
lib.buildCache {
  models = [
    (lib.fetchModel {
      repoId = "Qwen/Qwen3-30B-A3B";
      rev = "...";
      fileTreeHash = "sha256-...";
      gitRepoHash = "sha256-...";
    })
  ];
}


# in the actual config
# let
#   qwen3 = import ../cPkgs/models/Qwen3-30B-A3B.nix {
#     inherit nix-hug system;
#   };
# in
