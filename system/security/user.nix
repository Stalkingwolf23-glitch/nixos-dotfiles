{ config, lib, userSettings, ... }:

{
  # Wheel gets access to nix daemon
  nix.settings.trusted-users = [ "@wheel" ];

  users.users.${userSettings.username} = {
    isNormalUser = true;
    # description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [];
    # uid = 1000;
  };
}