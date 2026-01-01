{ config, pkgs, ... }:

{
  boot.kernelModules = [ "yt6801" ];

  # Only enable this if the driver is truly out-of-tree
  # boot.extraModulePackages = [
  #   config.boot.kernelPackages.yt6801
  # ];
}
