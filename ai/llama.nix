{ pkgs, config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/models 0750 user users -"
  ];

  systemd.user.services.llama-server = {
    serviceConfig = {
      ExecStart = "${pkgs.llama-cpp-rocm}/bin/llama-server -m /var/lib/models/current.gguf --alias Qwen3.6-35B-A3B-UD-Q6_K_XL --port 8080 -ngl 99 -ot ${"''"}.ffn_.*_exps.=CPU${"''"}";

      # hardening
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      PrivateTmp = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      RestrictSUIDSGID = true;
      RestrictNamespaces = true;
      LockPersonality = true;
      MemoryDenyWriteExecute = false;
      ReadOnlyPaths = [ "/var/lib/models" ];

      # ROCm device access — required, don't drop these
      DeviceAllow = [
        "/dev/kfd rw"
        "/dev/dri rw"
      ];
      SupplementaryGroups = [ "render" "video" ];
    };
    wantedBy = [ "default.target" ];
  };
}

# switch model
# ln -sfn /var/lib/models/new.gguf /var/lib/models/current.gguf && systemctl --user restart llama-server
