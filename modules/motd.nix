{ hostName, flakeName, config, ... }:

{
  environment.etc."motd".text = ''
    ${flakeName}
    Host: ${hostName}
    System: ${config.nixpkgs.hostPlatform.system}
    Kernel: ${config.boot.kernelPackages.kernel.version}
    Generation: ${config.system.stateVersion}
  '';
}
