{ pkgs, config, hermes-agent, ... }:

{
  services.hermes-agent = {
    enable = true;

    backend.mode = "none";

    settings = {
      model = {
        provider = "custom";
        base_url = "http://127.0.0.1:8080/v1";
        default = "Qwen3.6-35B-A3B-UD-Q6_K_XL";
      };

      model_aliases = {
        qwen36 = {
          model = "Qwen3.6-35B-A3B-UD-Q6_K_XL";
          provider = "custom";
          base_url = "http://127.0.0.1:8080/v1";
        };

        qwen3vl = {
          model = "Qwen3VL-8B-Instruct-Q4_K_M";
          provider = "custom";
          base_url = "http://127.0.0.1:8080/v1";
        };
      };

      toolsets = [
        "web"
        "terminal"
        "memory"
        "cron"
      ];
    };
  };
}
