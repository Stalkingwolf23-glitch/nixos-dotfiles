{self, ...}: {
  flake.modules.nixos.defaults = {
    pkgs,
    inputs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      cachix
      wget
      zsh
      git
      (pkgs.callPackage "${inputs.pnix}/package.nix" {})
    ];

    environment.localBinInPath = true;

    documentation = {
      enable = false;
      dev.enable = false;
      doc.enable = false;
      info.enable = false;
      man.enable = false;
      nixos.enable = false;
    };
  };

  flake.modules.nixos.common.imports = [self.modules.nixos.defaults];
}
