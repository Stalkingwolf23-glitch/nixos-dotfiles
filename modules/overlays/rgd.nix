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
        hash = "sha256-u7z9eke1LJ6X8Cshq12QRKUOEvIZkuB9tMygQqcBmsY=";
      };

      cargoHash = "sha256-J38WQMz8z7EZB0y6QrVuUvq1C5b+NKYsr9cf2C4k5YU=";

      buildInputs = [ sqlite ];
      nativeBuildInputs = [ pkg-config ];
    }
  ) { };
}
