{
  flake.modules.nixos.naraka-hardware = { lib, ... }: {
    nixpkgs.hostPlatform = "aarch64-linux";
    hardware.enableRedistributableFirmware = true;
    boot.supportedFilesystems.zfs = lib.mkForce false;
  };
}
