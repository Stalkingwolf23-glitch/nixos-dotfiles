{
  pkgs,
  inputs,
  ...
}:
{
  # install package
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    # quickshell
    # ... maybe other stuff
  ];

}
