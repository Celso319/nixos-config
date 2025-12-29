{ ... }:

{
  nix.settings = {
    experimental-features = [
     "nix-command"
     "flakes"
    ];

   trusted-users = [
     "root"
     "celso"
    ];

   auto-optimise-store = true;

 };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
