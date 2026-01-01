{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableGlobalCompInit = false; # disables the new-user wizard
    loginShellInit = ''
      # Show MOTD
      if [ -f /run/motd.dynamic ]; then
        cat /run/motd.dynamic
      fi

      # System info
      ${pkgs.fastfetch}/bin/fastfetch
    '';
  };

  environment.systemPackages = with pkgs; [
    fastfetch
  ];
}