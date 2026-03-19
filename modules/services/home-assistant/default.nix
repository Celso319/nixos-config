{ config, lib, pkgs, ... }:

let
  cfg = config.my.home-assistant;
in
{
  imports = [
    ./mqtt.nix
    ./zigbee.nix
  ];

  options.my.home-assistant = {
    enable = lib.mkEnableOption "Home Assistant";

    mqtt.enable = lib.mkEnableOption "MQTT broker";
    zigbee.enable = lib.mkEnableOption "Zigbee (via MQTT)";
  };

  config = lib.mkIf cfg.enable {

    services.home-assistant.config = lib.mkDefault {};

    services.home-assistant = {
      enable = true;
      openFirewall = true;

      config = lib.mkMerge [
        {
          homeassistant = {
            name = "nixos-ha";
            time_zone = "America/Fortaleza";
            unit_system = "metric";
          };

          frontend = {};
        }
      ];
    };

  };
}