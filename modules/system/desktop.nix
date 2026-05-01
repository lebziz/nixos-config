{ pkgs, ... };

{
    # Niri - Wayland compositor
    programs.niri.enable = true;

    # Display manager
    services.displayManager.sddm.enable = true;
    services.displayManager.defaultSession = "niri";

    # Input
    services.libinput.enable = true;

    # Portals (needed for Wayland apps)
    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.kdePackages.xdg-desktop-portal-kde
        ];
    };

    # Desktop services
    services.gvfs.enable = true;
    programs.dconf.enable = true;

    # Audio
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    # Bluetooth (mostly desktop usage)
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    # Fonts
    fonts.fontconfig.enable = true;
    fonts.packages = [
        (pkgs.stdenv.mkDerivation {
            name = "custom-fonts";
            src = ../../fonts;

            installPhase = ''
                mkdir -p $out/share/fonts/truetype
                cp -r $src/* $out/share/fonts/truetype/
            '';
        })
        pkgs.nerd-fonts.jetbrains-mono
    ];

    # Session variables (Wayland/Qt tweaks)
    environment.sessionVariables = {
        TERMINAL = "kitty";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };

    # MIME defaults (GUI behavior)
    xdg.mime.defaultApplications = {
        "image/png" = "nomacs.desktop";
        "application/pdf" = "org.kde.okular.desktop";
        "application/postscript" = "org.kde.okular.desktop";
        "image/tiff" = "org.kde.okular.desktop";
    };

    # X11 stack (if xserver needs to be enabled, set everything to true)
    services.xserver.enable = false;
    services.xserver.windowManager.qtile.enable = false;
    services.xserver.displayManager.startx.enable = false;
}
