{ config, lib, pkgs, inputs, ... }:

{
	imports =
		[
            ./system/packages.nix
            ./system/desktop.nix
		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.timeout = null;

	boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.supportedFilesystems = [ "fuse" ];
	boot.kernelModules = [ "fuse" ];

	networking.networkmanager.enable = true;

	time.timeZone = "Asia/Kolkata";

	i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";

        fcitx5.addons = with pkgs; [
            fcitx5-m17n
            fcitx5-gtk
        ];
    };

	users.users.meghith = {
		isNormalUser = true;
		description = "Meghith";
		extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "bluetooth" "plugdev" ];
		shell = pkgs.fish;
	};
	security.sudo.wheelNeedsPassword = true;

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};	

	services.greetd = {
		enable = false;
		settings = {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember";
				user = "greeter";
			};
		};
	};

	programs.firefox.enable = true;
	programs.fish.enable = true;
	programs.silentSDDM = {
		enable = true;
		theme = "rei";
	};
    
    qt = {
        enable = true;
        platformTheme = "qt5ct";
        style = "breeze";
    };

	nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [
        "pnpm-10.29.2"
      ];

	programs.gamemode.enable = true;
	programs.steam.enable = true;
	programs.nix-ld.enable = true;
	hardware.rtl-sdr.enable = true;

	services.udev.packages = with pkgs; [
		libmtp
	];
	# programs.xwayland.enable = true;
	# systemd.user.services.xwayland-satellite={
	# 	description = "Xwayland Satellite";
	# 	wantedBy = [ "graphical-session.target" ];
	# 	serviceConfig = {
	# 		ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
	# 		Restart = "always";
	# 	};
	# };

    # Ensure AccountsService is enabled (DMS needs this to read the avatar)
    services.accounts-daemon.enable = true;

    # Force NixOS to link your profile picture on every boot
    system.activationScripts.profilePicture = {
        text = ''
              mkdir -p /var/lib/AccountsService/{icons,users}
              cp /home/meghith/.face /var/lib/AccountsService/icons/meghith
              echo -e "[User]\nIcon=/var/lib/AccountsService/icons/meghith\n" > /var/lib/AccountsService/users/meghith
              chown root:root /var/lib/AccountsService/users/meghith
        '';
    };

	services.dbus.enable = true;
	services.dbus.packages = [ pkgs.kdePackages.kded ];
	services.udisks2.enable = true;
	hardware.enableRedistributableFirmware = true;
	hardware.graphics.enable32Bit = true;
	hardware.graphics.enable = true;
    services.tailscale.enable = true;

	nix.settings.experimental-features = ["nix-command" "flakes"];

	networking.firewall.enable = true;

	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
        
        extraSpecialArgs = {
            inherit inputs;
        };

		users.meghith = import ./home/home.nix;
	};

	system.stateVersion = "25.11";
}
