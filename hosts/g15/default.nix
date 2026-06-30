{ inputs, ... }:

{
    imports = 
        [
            ../../modules/common.nix
            ./hardware-configuration.nix
            ../../disko.nix

            inputs.disko.nixosModules.disko
            inputs.silentSDDM.nixosModules.default 
        ];

    networking.hostname = "g15";

    # other settings
}
