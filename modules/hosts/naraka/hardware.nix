{
  flake.modules.nixos.naraka-hardware = {lib, ...}: {
    hardware.enableRedistributableFirmware = true;
  };
}
