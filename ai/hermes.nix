{ inputs, config, hermes-agent, ... }: {
  imports = [ inputs.hermes-agent.homeManagerModules.default ];

  services.hermes-agent = {
    enable = true;

    gateway.enable = false;        # no Discord/Telegram/Slack
    backend.mode = "none";         # no dashboard/desktop socket

    settings = {
      model.base_url = "http://localhost:8080/v1";
      model.default = "qwen3-coder-30b-a3b";
      toolsets = [ "terminal" "memory" "cron" ];
    };

    environmentFiles = [ ./secrets/hermes-env ];  # placeholder key, local endpoint needs no real secret yet
  };
}
