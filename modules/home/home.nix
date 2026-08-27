{ pkgs, inputs, ... }:

{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];

    programs.dank-material-shell = {
        enable = true;
        enableSystemMonitoring = true;
        dgop.package = inputs.dgop.packages.${pkgs.system}.default;
    };

    services.batsignal = {
        enable = true;

        extraArgs = [
            "-w" "20"
            "-c" "10"
            "-d" "5"
        ];
    };

    gtk = {
        enable = true;

        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };

        iconTheme = {
            name = "candy-icons";
            package = pkgs.candy-icons;
        };

        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };

	programs.neovim = {
		enable = true;
		defaultEditor = true;
        extraPackages = with pkgs; [
            tree-sitter
            gcc
        ];
	extraLuaConfig = builtins.readFile ./configs/nvim/init.lua;
	};	
    
    # programs.fish.enable = true;
    #
    # programs.kitty.enable = true;

    # home.file.".config/kitty".source = ./config/kitty;
    # home.file.".config/fish".source = ./config/fish;
    # home.file.".config/cava".source = ./config/cava;
    # home.file.".config/cmus".source = ./config/cmus;

    home.stateVersion = "25.11";

    home.packages = with pkgs; [
        vscode-langservers-extracted
        typescript-language-server
        typescript
    ];
}
