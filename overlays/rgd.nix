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
        hash = "sha256-Xv/J59nE0xUrU792V49edBXk2Yca6Yl7c1L56/otu8Y=";
      };

      cargoHash = "sha256-FDcloq6SN7m+5TUPr7fjOFZ4yR2ShPI06gHI/6DnUSs=";

      buildInputs = [ sqlite ];
      nativeBuildInputs = [ pkg-config ];
    }
  ) { };
}
