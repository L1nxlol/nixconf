{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "hermes-sandboxed" ''
      exec ${pkgs.bubblewrap}/bin/bwrap \
        --ro-bind /nix /nix \
        --ro-bind /etc /etc \

        --dir /home/agent \
        --chdir /home/agent \
        --bind "$HOME/.hermes" /home/agent/.hermes \
        --bind "$HOME/Agent" /home/workspace/ \
        --setenv HOME /home/agent \

        --tmpfs /tmp \
        --dev /dev \
        --proc /proc \

        --unshare-pid \
        --die-with-parent \
        hermes chat "$@"
    '')
  ];
}
