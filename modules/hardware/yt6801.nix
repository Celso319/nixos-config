{ config, lib, ... }:

{
  boot.extraModulePackages = [
    config.boot.kernelPackages.yt6801
  ];

  boot.kernelModules = [ "yt6801" ];
  boot.initrd.availableKernelModules = [ "yt6801" ];

  hardware.enableRedistributableFirmware = true;

  assertions = [
    {
      assertion = config.boot.kernelPackages ? yt6801;
      message = "yt6801 (driver ethernet chinês) requires a kernel with yt6801 support (e.g. linuxPackages_6_6)";
    }
  ];
}
