{ config, lib, pkgs, ... }:

let
  cfg = config.my.home-assistant;
in
{
  config = lib.mkIf (cfg.enable && cfg.zigbee.enable) {

    # Optional: assert MQTT is enabled
    assertions = [
      {
        assertion = cfg.mqtt.enable;
        message = "Zigbee requires MQTT (my.home-assistant.mqtt.enable = true)";
      }
    ];

    # Zigbee2MQTT service
    systemd.services.zigbee2mqtt = {
      description = "Zigbee2MQTT";
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.zigbee2mqtt}/bin/zigbee2mqtt";
        Restart = "always";

        # optional hardening
        DynamicUser = true;
        StateDirectory = "zigbee2mqtt";
      };
    };

    # HA side (discovery happens via MQTT)
    services.home-assistant.config = lib.mkMerge [
      {
        # Nothing fancy needed—Z2M publishes automatically
        homeassistant = { };
      }
    ];

  };
}