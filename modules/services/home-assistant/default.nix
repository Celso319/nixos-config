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

    systemd.tmpfiles.rules = [
  "d /var/lib/hass 0755 1000 1000 -"
];


    virtualisation.oci-containers.containers = lib.mkMerge [

      {
        home-assistant = {
          image = "ghcr.io/home-assistant/home-assistant:stable";

          ports = [ "8123:8123" ];

          volumes = [
            "/var/lib/hass:/config"
            "/etc/localtime:/etc/localtime:ro"
          ];

          environment = {
            TZ = "America/Fortaleza";
          };

          extraOptions = [
            "--network=host"
            "--user=1000:1000"
          ];
        };
      }

    ];

  };
}