{ pkgs, config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/models 0750 user users -"
  ];

  systemd.user.services.llama-server = {
    serviceConfig = {
      ExecStart = "${pkgs.llama-cpp-rocm}/bin/llama-server \
        -m /var/lib/models/current.gguf \
        --alias Qwen3.6-35B-A3B-UD-Q6_K_XL \
        --host 127.0.0.1 \
        --port 8080 \
        --ctx-size 65536 \
        --parallel 1 \
        --cache-type-k q8_0 \
        --cache-type-v q8_0 \
        -ngl 99 \
        -ot ${"''"}.ffn_.*_exps.=CPU${"''"}";

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

      # ROCm device access
      # Required don't drop these
      DeviceAllow = [
        "/dev/kfd rw"
        "/dev/dri rw"
      ];
      # SupplementaryGroups = [ "render" "video" ];
    };
    wantedBy = [ "default.target" ];
  };
}

# switch model
# ln -sfn /var/lib/models/new.gguf /var/lib/models/current.gguf && systemctl --user restart llama-server
