{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";

		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		niri = {
			url = "github:sodiboo/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		dms = {
			url = "github:AvengeMedia/DankMaterialShell/stable";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		dgop = {
			url = "github:AvengeMedia/dgop";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		silentSDDM = {
			url = "github:uiriansan/SilentSDDM";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        my-nixvim = {
            url = "github:lebziz/neovim-nix-config";
        };
	};

	outputs = { self, nixpkgs, disko, home-manager, zen-browser, ... }@inputs:
	{
        nixosConfigurations = {
            ideapad = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit inputs;
                };
                modules = [
                    ./hosts/ideapad/default.nix
                    home-manager.nixosModules.home-manager 
                ];
            };

            loq = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit inputs;
                };
                modules = [
                    ./hosts/loq/default.nix
                    home-manager.nixosModules.home-manager 
                ];
            };
        };
	};
}
