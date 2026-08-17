{ self, ... }:

{
  flake.modules.nixos.performance =
    { pkgs, ... }:
    {
      services.earlyoom.enable = true;
      services.earlyoom.freeSwapThreshold = 20;
      services.earlyoom.freeMemThreshold = 5;

      zramSwap = {
        enable = true;
        algorithm = "zstd";
        priority = 100;
        memoryPercent = 100;
      };

      services.irqbalance.enable = true;
      services.fstrim.enable = true;

      services.ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-rules-cachyos;
      };

      services.scx = {
        enable = true;
        scheduler = "scx_lavd";
      };
    };
  flake.modules.nixos.cocytus-system.imports = [ self.modules.nixos.performance ];
}
