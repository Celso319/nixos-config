{ hostName, flakeName, ... }:

{
  environment.etc."motd".text = ''
    ${flakeName}
    Host: ${hostName}
    System: ${pkgs.stdenv.hostPlatform.system}
    Kernel: ${config.boot.kernelPackages.kernel.version}
    Generation: ${config.system.stateVersion}
  '';
}
