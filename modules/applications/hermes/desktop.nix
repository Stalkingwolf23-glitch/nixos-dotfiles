{
  self,
  user,
  ...
}: {
  flake.modules.nixos.hermes-desktop = {
    pkgs,
    inputs,
    ...
  }: {
    nixpkgs.overlays = [ inputs.llm-agents.overlays.shared-nixpkgs ];
    environment.systemPackages = [pkgs.llm-agents.hermes-desktop];
  };

  flake.modules.nixos.hermes-desktop-preservation = {
    preservation.preserveAt."/persist".users.${user}.directories = [
      ".config/Hermes"
      ".hermes"
    ];
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.hermes-desktop-preservation];
}
