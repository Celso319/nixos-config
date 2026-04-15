{ config, lib, pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;
      # optional but nice:
      dockerCompat = true;
    };

    oci-containers = {
      backend = "podman";
    };
  };
}