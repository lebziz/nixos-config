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

    networking.hostname = "ideapad";

	fileSystems."/mnt/driveD" = {
		device = "/dev/disk/by-uuid/5484003384001A5E";
		fsType = "ntfs";
		options = [ "rw" "uuid=1000" "gid=100" "nofail" ];
	};

	fileSystems."/mnt/driveE" = {
		device = "/dev/disk/by-uuid/F234F94234F90A7D";
		fsType = "ntfs";
		options = [ "rw" "uuid=1000" "gid=100" "nofail" ];
	};

}
