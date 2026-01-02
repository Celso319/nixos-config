{ config, pkgs, ... }:

{
  # Headless / no HDMI
  services.xserver.enable = false;

  console.enable = true;

  systemd.defaultUnit = "multi-user.target";

  boot.kernelParams = [
    "nomodeset"
  ];
}
