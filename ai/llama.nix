{ pkgs, config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/models 0750 user users -"
  ];

  systemd.user.services.llama-server = {
    serviceConfig = {
      ExecStart = "${pkgs.llama-cpp-rocm}/bin/llama-server \
        --models-dir /var/lib/models \
        --models-max 1 \
        --host 127.0.0.1 \
        --port 8080 \
        --ctx-size 65536 \
        --parallel 1 \
        --cache-type-k q8_0 \
        --cache-type-v q8_0 \
        -ngl 99 \
        -ot ${"''"}.ffn_.*_exps.=CPU${"''"}";

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

      DeviceAllow = [
        "/dev/kfd rw"
        "/dev/dri rw"
      ];
    };

    wantedBy = [ "default.target" ];
  };
}
