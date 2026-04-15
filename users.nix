{ pkgs, ... }:

{

  users.defaultUserShell = pkgs.zsh;
  
  environment.etc."skel/.zshrc".text = ""; # Skeleton files for new users

  users.users.celso = {
    isNormalUser = true;
    description = "Celso Arthur";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];


    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyJ/SLfhM+dGtUrojKlJOaFcz1vMidPkPjuuF0lzPEd celso@pc"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+aZ/jsGMAfMk3seyObhgpoar0/apdHI6OW9moKRgP0 celso@debiannote"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPxHVCnuPX1F2Ekvi2+bBn82PQdJGbno7G36Jh4YPIgV celso@debian-note-home"
    ];
  };
}
