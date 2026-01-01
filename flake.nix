{
    description = ''Celso NixOS Systems  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    flakeName = ''                                                                                                                                  
    mmmm   mmmmmmmm  mm          mmmm      mmmm                                                                                   
  ##""""#  ##""""""  ##        m#""""#    ##""##                                                                                  
 ##"       ##        ##        ##m       ##    ##                                                                                 
 ##        #######   ##         "####m   ##    ##                                                                                 
 ##m       ##        ##             "##  ##    ##                                                                                 
  ##mmmm#  ##mmmmmm  ##mmmmmm  #mmmmm#"   ##mm##                                                                                  
    """"   """"""""  """"""""   """""      """"                                                                                   
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
 mmm   mm     ##                 mmmm      mmmm                mmmm                                                               
 ###   ##     ""                ##""##   m#""""#             m#""""#                         ##                                   
 ##"#  ##   ####     "##  ##"  ##    ##  ##m                 ##m       "##  ###  mm#####m  #######    m####m   ####m##m  mm#####m 
 ## ## ##     ##       ####    ##    ##   "####m              "####m    ##m ##   ##mmmm "    ##      ##mmmm##  ## ## ##  ##mmmm " 
 ##  #m##     ##       m##m    ##    ##       "##                 "##    ####"    """"##m    ##      ##""""""  ## ## ##   """"##m 
 ##   ###  mmm##mmm   m#""#m    ##mm##   #mmmmm#"            #mmmmm#"     ###    #mmmmm##    ##mmm   "##mmmm#  ## ## ##  #mmmmm## 
 ""   """  """"""""  """  """    """"     """""               """""       ##      """"""      """"     """""   "" "" ""   """"""  
                                                                        ###                                                       
                                                                                                                                  '';

    commonModules = [
      ./modules

    ];
  in {
    nixosConfigurations = {
      vm1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          hostName = "vm1";
          inherit flakeName;
        };

        modules =
          commonModules ++ [
            ./hosts/vm1/default.nix
          ];
      };

      mllse = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          hostName = "mllse";
          inherit flakeName;
        };

        modules =
          commonModules ++ [
            ./hosts/mllse/default.nix
          ];
      };
    };
  };
}
