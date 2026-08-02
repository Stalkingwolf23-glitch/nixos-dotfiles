{ pkgs, ... }:
{
  # to help close naughty processes that guzzle resources
  services.earlyoom.enable = true;
  services.earlyoom.freeSwapThreshold = 20;
  services.earlyoom.freeMemThreshold = 5;

  # 16GB swap for overhead after zram is capped
  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # MiB, adjust to taste
      priority = 10; # well below zram's 100, so zram is always preferred
    }
  ];

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
    # scx_lavd: deadline-based, preferred-core-aware (via amd_pstate=active).
    # Keeps latency-sensitive threads (games) on CCD0 (V-Cache) and throughput on CCD1.
    scheduler = "scx_lavd";
  };
}
