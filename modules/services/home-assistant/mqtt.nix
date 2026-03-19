{ config, lib, ... }:

let
  cfg = config.my.home-assistant;
in
{
  config = lib.mkIf (cfg.enable && cfg.mqtt.enable) {

    services.mosquitto = {
      enable = true;

      listeners = [
        {
          address = "127.0.0.1";
          port = 1883;
        }
      ];
    };

    # Inject MQTT into Home Assistant
    services.home-assistant.config = lib.mkMerge [
      {
        mqtt = {
          broker = "127.0.0.1";
        };
      }
    ];

  };
}