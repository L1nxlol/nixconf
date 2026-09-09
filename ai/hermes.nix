{ pkgs, config, hermes-agent, ... }:

{
  services.hermes-agent = {
    enable = true;

    backend.mode = "none";

    settings = {
      model.base_url = "http://localhost:8080/v1";
      model.default = "Qwen3.6-35B-A3B-UD-Q6_K_XL";

      toolsets = [
        "web"
        "terminal"
        "memory"
        "cron"
      ];
    };

    # environmentFiles = [ ./hermes-env.nix ];
  };
}
