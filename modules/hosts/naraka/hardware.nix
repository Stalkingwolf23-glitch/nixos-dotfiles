{
  flake.modules.nixos.naraka-hardware = { lib, ... }: {

    nixpkgs.hostPlatform = "aarch64-linux";
    hardware = {
      enableRedistributableFirmware = true;
      raspberry-pi.firmware.uboot.enable = true;
    };
    # The pinned Raspberry Pi kernel does not build the ZFS module.
    boot.supportedFilesystems.zfs = lib.mkForce false;
  };
}
