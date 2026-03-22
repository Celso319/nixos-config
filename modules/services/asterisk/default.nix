{ config, lib, pkgs, ... }:

let
  cfg = config.my.asterisk;
in
{
  options.my.asterisk = {
    enable = lib.mkEnableOption "Asterisk PBX";
  };
    config = lib.mkIf cfg.enable {
    services.asterisk = {
      enable = true;
    };
  };
}