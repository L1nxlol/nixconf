{ nix-hug, system }:

let
  lib = nix-hug.lib.${system};
in
lib.buildCache {
  models = [
    (lib.fetchModel {
      repoId = "Qwen/Qwen3-30B-A3B-GGUF";
      rev = "e4d4bafdfb96a411a163846265362aceb0b9c63a";
      fileTreeHash = "sha256-ooUKIwyyfoPUKAgGRl9igHDYZ4IGhnOi76GuNU8NJWw=";
      gitRepoHash = "sha256-T6gOPz5hV45ej+PZvmuHM9nfue9MC/0ZSyVH8xN0zgY=";
      filters = { include = [ "Qwen3-30B-A3B-Q8_0\\.gguf" ]; };
    })
  ];
}


# in the actual config
# let
#   qwen3 = import ../cPkgs/models/Qwen3-30B-A3B.nix {
#     inherit nix-hug system;
#   };
# in
