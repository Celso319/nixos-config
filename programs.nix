{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableGlobalCompInit = false; # disables the new-user wizard
  };
}
