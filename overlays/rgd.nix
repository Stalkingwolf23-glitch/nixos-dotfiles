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
        hash = "sha256-4g0lEiGqETb4jNyb8hcJ57y0rIIKr/Ofy69+9+ikM3A=";
      };

      cargoHash = "sha256-LD0onGVNdM0F5Ot/trXVGKjf1YHlHYlyYXzICks8nYQ=";

      buildInputs = [ sqlite ];
      nativeBuildInputs = [ pkg-config ];
    }
  ) { };
}
