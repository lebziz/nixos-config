{ inputs, pkgs, ... }:

{
    imports = 
        [
            ../../modules/common.nix
            ./hardware-configuration.nix
            ../../disko.nix

            inputs.disko.nixosModules.disko
            inputs.silentSDDM.nixosModules.default 
        ];

    networking.hostName = "loq";

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;

        # RTX 4050: proprietary driver is generally the safest choice
        open = false;

        nvidiaSettings = true;

        powerManagement.enable = true;

        prime = {
            offload.enable = true;
            offload.enableOffloadCmd = true;

            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };

        dynamicBoost.enable = true;
    };

    services.udev.extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c993", MODE="0666"
    '';
}
