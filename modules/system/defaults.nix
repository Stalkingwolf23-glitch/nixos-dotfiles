{ self, ... }:

{
  flake.modules.nixos.defaults =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        cachix
        wget
        zsh
        git
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

  flake.modules.nixos.common.imports = [ self.modules.nixos.defaults ];
}
