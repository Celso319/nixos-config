{ config, lib, ... }:

let
  cfg = config.my.home-assistant;
in
{
  config = lib.mkIf (cfg.enable && cfg.mqtt.enable) {

    virtualisation.oci-containers.containers = {

      mosquitto = {
        image = "eclipse-mosquitto:latest";

        ports = [ "1883:1883" ];

        volumes = [
          "/var/lib/mosquitto:/mosquitto/data"
          "/var/lib/mosquitto/log:/mosquitto/log"
        ];

        extraOptions = [
          "--network=host"
        ];
      };

    };

  };
}