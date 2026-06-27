final: prev: {
  rgd = prev.callPackage (
    {
      fetchFromGitHub,
      rustPlatform,
      sqlite,
      pkg-config,
    }:
    rustPlatform.buildRustPackage {
      pname = "rgd";
      version = "unstable";

      src = fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "rgd";
        rev = "main";
        hash = "sha256-dVODE/FHCZebcb+WcD0frdF/zOYTyrmtgPLKt6vbQ9Q=";
      };

      cargoHash = "sha256-C02A8PmmOrkQd5eAKpxay8+23srAckTCxvllw6aXiQM=";

      buildInputs = [ sqlite ];
      nativeBuildInputs = [ pkg-config ];
    }
  ) { };
}
