{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
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
	};

	outputs = { self, nixpkgs, disko, home-manager, ... }@inputs:
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {
				inherit inputs;
			};
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
			];
		};
	};
}
