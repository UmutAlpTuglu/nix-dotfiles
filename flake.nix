{
    description = "All-in-one flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixgl.url = "github:guibou/nixGL";
        nur.url = github:nix-community/nur;
        stylix.url = "github:danth/stylix";
        deploy-rs = {
            url = "github:serokell/deploy-rs";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { self, nixpkgs, home-manager, nur, nixgl, stylix, deploy-rs, sops-nix, ... }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
            lib = nixpkgs.lib;
        in {
            homeConfigurations = {
                legion = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [
                        {
                            nixpkgs.overlays = [
                                nur.overlay
                                nixgl.overlay
                            ];
                        }
                        stylix.homeManagerModules.stylix
                        ./hosts/legion/home.nix
                        sops-nix.homeManagerModules.sops
                        ./hosts/legion/private-config.nix
                    ];
                };
            };

        };
}
