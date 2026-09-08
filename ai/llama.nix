{ pkgs, config, ... }:

{
  environment.systemPackages = [ pkgs.llama-cpp-rocm ];
  systemd.user.services.llama-server = {
    serviceConfig.ExecStart = "${pkgs.llama-cpp-rocm}/bin/llama-server -m %h/Models/current.gguf --port 8080 -ngl 99 -ot ${"''"}.ffn_.*_exps.=CPU${"''"}";
    wantedBy = [ "default.target" ];
  };
}

# switch model
# ln -sfn new.gguf ~/Models/current.gguf && systemctl --user restart llama-server
