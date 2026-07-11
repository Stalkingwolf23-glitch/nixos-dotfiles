inputs: final: prev: {
  rgd = prev.callPackage (
    {
      rustPlatform,
      sqlite,
      pkg-config,
    }:
    rustPlatform.buildRustPackage {
      pname = "rgd";
      version = "unstable";

      src = inputs.rgd;

      cargoLock.lockFile = "${inputs.rgd}/Cargo.lock";

      buildInputs = [ sqlite ];
      nativeBuildInputs = [ pkg-config ];
    }
  ) { };
}
