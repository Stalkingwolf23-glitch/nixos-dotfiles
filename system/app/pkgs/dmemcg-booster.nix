{
  rustPlatform,
  fetchFromGitLab,
  pkg-config,
  dbus,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "dmemcg-booster";
  version = "0.1.1";

  src = fetchFromGitLab {
    domain = "gitlab.steamos.cloud";
    owner = "holo";
    repo = "dmemcg-booster";
    tag = finalAttrs.version;
    hash = "sha256-g4rm8Oh1vDuuK2VXNs5A0HANyGWuY80wM0v69LCphf0=";
  };

  postPatch = ''
    substituteInPlace *.service \
      --replace-fail /usr/bin/dmemcg-booster $out/bin/dmemcg-booster
  '';

  cargoHash = "sha256-T0z191ssrkxJB/x3l6wvXJ70UMEmLBD9e2ZjNTBrk+Y=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    dbus
  ];

  postInstall = ''
    install -Dm644 dmemcg-booster-system.service "$out/lib/systemd/system/dmemcg-booster-system.service"
    install -Dm644 dmemcg-booster-user.service "$out/lib/systemd/user/dmemcg-booster-user.service"
  '';
})
