{ config, pkgs, ... }:
{
home.file.".p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Nix";
      hmrebuild = "home-manager switch --flake ~/Nix";
      v = "nvim";
      vim = "nvim";
      sreboot = "systemctl soft-reboot";
      off = "shutdown 0";
      update = "sudo nix flake update --flake ~/Nix";
      fastfetch = "fastfetch -c './fastfetch.jsonc'";
    };
  };
}
