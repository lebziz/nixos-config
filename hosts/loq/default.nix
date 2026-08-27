{ config, inputs, pkgs, ... }:

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

        package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "610.57.04";
            sha256_64bit = "sha256-suk1xmuDuwDAyFe8jg7g/VLekoa0DJzB7sKafOfrEW0=";
            sha256_aarch64 = "sha256-QCefrMBCmpOwuOyXv1k5Gj0iB2CYlPgnG3JToUw/j54=";
            openSha256 = "sha256-rQHOOOY4KL92Ww3KDwh+j4eGU7oNAH8LutZC5wmFnPo=";
            settingsSha256 = "sha256-ZEMo8I8Zc2Tq6RVDNYpAH+f094dUaZiBqO+5f6lIjRI=";
            persistencedSha256 = "sha256-aXmD2VY1RLlgAnlHhOUMWzvMyhI6JTClcFLm4imF/mA=";
        };
    };

    # environment.sessionVariables = {
    #     MOZ_ENABLE_WAYLAND = "1";
    #     LIBVA_DRIVER_NAME = "iHD";
    #     MOZ_DISABLE_RDD_SANDBOX = "1";
    #     # MOZ_DISABLE_UTILITY_SANDBOX = "1";
    #     # LIBVA_DRIVERS_PATH = "/run/opengl-driver/lib/dri";
    # };
    #
    services.udev.extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c993", MODE="0666"
    '';

    nix.settings = {
        http-connections = 128;
        max-substitution-jobs = 128;
        max-jobs = "auto";
    };
}
