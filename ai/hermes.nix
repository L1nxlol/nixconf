{ pkgs, config, hermes-agent, ... }:

{
  services.hermes-agent = {
    enable = true;

    backend.mode = "none";

    settings = {
      model.base_url = "http://localhost:8080/v1";
      model.default = "qwen3-coder-30b-a3b";

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
