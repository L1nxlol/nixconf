{ config, pkgs, ... }:

{
home.file.".p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    initContent = ''
      if [[ "$TERM" == "linux" ]]; then
        setopt prompt_subst
        _tty_git() {
          local b ab s
          b=$(git symbolic-ref --short HEAD 2>/dev/null) || return
          ab=$(git rev-list --left-right --count '@{u}...HEAD' 2>/dev/null | awk '{print "-"$1" +"$2}')
          git diff --quiet 2>/dev/null && s=ok || s='%F{red}dirty%F{cyan}'
          print -n "> $b $ab $s "
        }

        # PROMPT='%F{cyan}%(?.ok.%?) > %T > %1~ $(_tty_git)%f
    # %F{cyan}->%f '
    PROMPT='%F{cyan}%~ ->%f '
      else
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      fi

      clear-scrollback() {
        printf '\033[3J\033[H\033[2J'
        zle reset-prompt
        zle redisplay
      }
      zle -N clear-scrollback
      bindkey '^L' clear-scrollback
      bindkey '^H' backward-kill-word
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Nix --impure";
      hmrebuild = "home-manager switch --flake ~/Nix";
      v = "nvim";
      vim = "nvim";
      sreboot = "systemctl soft-reboot";
      off = "shutdown 0";
      update = "sudo nix flake update --flake ~/Nix";
      fastfetch = "fastfetch -c '/home/user/Nix/home/misc/fastfetch.jsonc'";

      hermes = "hermes-sandboxed";

      clear = "printf '\\033[3J\\033[H\\033[2J'";
    };
  };
}
