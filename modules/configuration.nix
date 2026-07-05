{
  inputs,
  recursivelyImport,
  ...
}:

{
  imports = recursivelyImport [
    # Include the results of the hardware scan.
    ./system/hardware-configuration.nix
    ./system
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  # Optimization
  nix.optimise.automatic = true;

  nix.settings = {
    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "26.05"; # Did you read the comment? Did you?
}
