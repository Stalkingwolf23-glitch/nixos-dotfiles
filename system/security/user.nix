{
  userSettings,
  ...
}:

{
  # Wheel gets access to nix daemon
  nix.settings.trusted-users = [ "@wheel" ];

  users.users.${userSettings.username} = {
    isNormalUser = true;
    # description = userSettings.name;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
  };
}
