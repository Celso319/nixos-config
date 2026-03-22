{ hostName, flakeName, config, ... }:

{
  environment.etc."motd".text = ''
    ${flakeName}
    Host: ${hostName}
    System: ${config.nixpkgs.hostPlatform.system}
    Kernel: ${config.boot.kernelPackages.kernel.version}
    State Vesion: ${config.system.stateVersion}
  '';
}
