{ config, lib, pkgs, ... }:

let
  cfg = config.my.asterisk;
#  confDir = ./asterisk-conf;
in
{
  options.my.asterisk = {
    enable = lib.mkEnableOption "Asterisk PBX";
  };
    config = lib.mkIf cfg.enable {
    services.asterisk = {
      enable = true;

      confFiles = { 
  "extensions.conf" = ''
[interno]

exten => _X,1,Dial(PJSIP/000${EXTEN})
  '';
  "pjsip.conf" = ''
    [transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

; Ramal 0001
[0001]
type=endpoint
context=interno
disallow=all
allow=ulaw
auth=0001
aors=0001

[0001]
type=auth
auth_type=userpass
username=0001
password=senha0001

[0001]
type=aor
max_contacts=1
remove_existing=yes
qualify_frequency=30


; Ramal 0002
[0002]
type=endpoint
context=interno
disallow=all
allow=ulaw
auth=0002
aors=0002

[0002]
type=auth
auth_type=userpass
username=0002
password=senha0002

[0002]
type=aor
max_contacts=1
remove_existing=yes
qualify_frequency=30

; Ramal 0003
[0003]
type=endpoint
context=interno
disallow=all
allow=ulaw
auth=0003
aors=0003

[0003]
type=auth
auth_type=userpass
username=0003
password=senha0003

[0003]
type=aor
max_contacts=1
remove_existing=yes
qualify_frequency=30


; Ramal 0004
[0004]
type=endpoint
context=interno
disallow=all
allow=ulaw
auth=0004
aors=0004

[0004]
type=auth
auth_type=userpass
username=0004
password=senha0004

[0004]
type=aor
max_contacts=1
remove_existing=yes
qualify_frequency=30
  '';
         
      };
    };
  };
}