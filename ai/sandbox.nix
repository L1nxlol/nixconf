# { pkgs, ... }:
#
# {
#   environment.systemPackages = [
#     (pkgs.writeShellScriptBin "hermes-sandboxed" ''
#       set -euo pipefail
#
#       ALLOWED_IPS="140.82.112.0/20 185.199.108.0/22"  # example: github.com + githubusercontent ranges
#
#       exec ${pkgs.bubblewrap}/bin/bwrap \
#         --ro-bind /nix /nix \
#         --ro-bind /etc /etc \
#         --dir /home/agent \
#         --chdir /home/agent \
#         --bind "$HOME/.hermes" /home/agent/.hermes \
#         --bind "$HOME/Agent" /home/workspace/ \
#         --setenv HOME /home/agent \
#         --tmpfs /tmp \
#         --dev /dev \
#         --proc /proc \
#         --unshare-pid \
#         --unshare-net \
#         --die-with-parent \
#         ${pkgs.passt}/bin/pasta --config-net -t 8080 -- \
#         bash -c '
#           ${pkgs.nftables}/bin/nft add table inet filter
#           ${pkgs.nftables}/bin/nft add chain inet filter output "{ type filter hook output priority 0 ; policy drop ; }"
#           ${pkgs.nftables}/bin/nft add rule inet filter output ip daddr 127.0.0.1 accept
#           for ip in $ALLOWED_IPS; do
#             ${pkgs.nftables}/bin/nft add rule inet filter output ip daddr $ip accept
#           done
#           exec hermes chat "$@"
#         ' -- "$@"
#     '')
#   ];
# }



# RISKY \/\/\/
{ pkgs, hermes-agent, inputs, system, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "hermes-sandboxed" ''
      exec ${pkgs.bubblewrap}/bin/bwrap \
        --ro-bind /nix /nix \
        --ro-bind /etc /etc \
        --dir /home/agent \
        --bind "$HOME/.hermes" /home/agent/.hermes \
        --bind "$HOME/Agent" /home/workspace/ \
        --chdir /home/agent \
        --setenv HOME /home/agent \
        --tmpfs /tmp \
        --dev /dev \
        --proc /proc \
        --unshare-pid \
        --die-with-parent \
        --new-session \
        --cap-drop ALL \
        ${inputs.hermes-agent.packages.${pkgs.system}.default}/bin/hermes
    '')
  ];
}
