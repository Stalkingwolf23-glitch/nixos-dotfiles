# { inputs, ... }:

{
  # flake-file.inputs.nixos-hardware = {
  #   url = "github:NixOS/nixos-hardware/master";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };

  flake.modules.nixos.naraka-hardware = { lib, ... }: {
    # imports = [ inputs.nixos-hardware.nixosModules.raspberry-pi-5 ];

    nixpkgs.hostPlatform = "aarch64-linux";
    hardware = {
      enableRedistributableFirmware = true;
      # raspberry-pi.firmware.uboot.enable = true;
    };
    # The pinned Raspberry Pi kernel does not build the ZFS module.
    boot.supportedFilesystems.zfs = lib.mkForce false;
  };
}
