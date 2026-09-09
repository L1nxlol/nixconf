{ pkgs, config, hermes-agent, ... }:

{
  services.hermes-agent = {
    enable = true;

    backend.mode = "none";

    settings = {
      provider = "custom";
      model.base_url = "http://127.0.0.1:8000/v1";
      model.default = "Qwen3.6-35B-A3B-UD-Q6_K_XL";

      toolsets = [
        "web"
        "terminal"
        "memory"
        "cron"
      ];
    };
  };
}
