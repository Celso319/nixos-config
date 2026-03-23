{ config, lib, pkgs, ... }:

let
  cfg = config.my.asterisk;
#  confDir = ./asterisk-conf;
in
{
  options.my.asterisk = {
    enable = lib.mkEnableOption "Asterisk PBX";
  };
    config = lib.mkIf cfg.enable {
    services.asterisk = {
      enable = true;
      confFiles = { 
        "extensions.conf" = builtins.readFile ./asterisk-conf/extensions.conf;
        "pjsip.conf"      = builtins.readFile ./asterisk-conf/pjsip.conf;
      };
    };
    networking.firewall.enable = false;
  };
}