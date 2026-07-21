{
  recursivelyImport,
  flakeInputs,
  config,
  ...
}:

{
  imports = [
    flakeInputs
  ]
  ++ recursivelyImport [
    # Include the results of the hardware scan.
    ./system/hardware-configuration.nix
    ./system
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

  nix.extraOptions = "!include ${config.sops.secrets.github_token.path}";

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "26.05"; # Did you read the comment? Did you?
}
