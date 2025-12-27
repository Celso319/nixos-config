{
 description = "Celso NixOS systems";

 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
 };

 outputs = { self, nixpkgs }: {
   nixosConfigurations.vm1 =
     nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         ./hosts/vm1
       ];
     };
 };
}
