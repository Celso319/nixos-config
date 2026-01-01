{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableGlobalCompInit = false; # disables the new-user wizard
    interactiveShellInit = ""; # DIE WIZARD
    loginShellInit = ''
      # Show MOTD
      cat /etc/motd

      # System info
      ${pkgs.fastfetch}/bin/fastfetch
    '';
  };

  environment.systemPackages = with pkgs; [
    fastfetch
  ];
}