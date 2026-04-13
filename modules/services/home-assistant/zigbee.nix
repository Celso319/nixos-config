{ config, lib, pkgs, ... }:

let
  cfg = config.my.home-assistant;
in
{
  config = lib.mkIf (cfg.enable && cfg.zigbee.enable) {

    assertions = [
      {
        assertion = cfg.mqtt.enable;
        message = "Zigbee requires MQTT (my.home-assistant.mqtt.enable = true)";
      }
    ];

    virtualisation.oci-containers.containers = {

      zigbee2mqtt = {
        image = "koenkk/zigbee2mqtt";

        ports = [ "8080:8080" ];

        volumes = [
          "/var/lib/zigbee2mqtt:/app/data"
        ];

        environment = {
          TZ = "America/Fortaleza";
        };

        extraOptions = [
          "--device=/dev/ttyUSB0"
          "--network=host"
        ];
      };

    };

  };
}