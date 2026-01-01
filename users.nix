{ pkgs, ... }:

{

  users.defaultUserShell = pkgs.zsh;

  users.users.celso = {
    isNormalUser = true;
    description = "Celso Arthur";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];


    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyJ/SLfhM+dGtUrojKlJOaFcz1vMidPkPjuuF0lzPEd celso@pc"
    ];
  };
}
