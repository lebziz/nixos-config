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

    networking.hostName = "g15";

    # other settings
}
