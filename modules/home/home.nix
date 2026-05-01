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

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};	
    
    programs.fish.enable = true;

    programs.kitty.enable = true;

    home.file.".config/kitty".source = ./config/kitty;
    home.file.".config/nvim".source = ./config/nvim;
    home.file.".config/fish".source = ./config/fish;
    home.file.".config/cava".source = ./config/cava;
    home.file.".config/cmus".source = ./config/cmus;

    home.stateVersion = "25.11";
}
