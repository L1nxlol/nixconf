{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "hermes-sandboxed" ''
      exec ${pkgs.bubblewrap}/bin/bwrap \
        --ro-bind /nix /nix \
        --ro-bind /usr /usr \
        --ro-bind /bin /bin \
        --ro-bind /lib /lib \
        --ro-bind /lib64 /lib64 \
        --bind "$HOME/.hermes" "$HOME/.hermes" \
        --bind "$HOME/Model/<project>" "$HOME/Model/<project>" \
        --tmpfs /tmp \
        --unshare-pid \
        --die-with-parent \
        hermes chat "$@"
    '')
  ];
}
