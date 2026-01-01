{ hostName, flakeName, ... }:

{
  environment.etc."motd".text = ''
    ${flakeName}
    Host: ${hostName}
  '';
}
