{
  stdenv,
  fetchFromGitHub,
  cmake,
  kdePackages,
  qt6,
  kcgroups,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "plasma-foreground-booster";
  version = "dmemcg-experimental-3";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "kcgroups";
    tag = "booster-${finalAttrs.version}";
    hash = "sha256-uzC9OYBh8hj7TINKDOxqONOyHPYIPH4/MHuYwYFHupE=";
  };

  postPatch = ''
    substituteInPlace plasma-foreground-booster.service.in \
      --replace-fail /usr/bin/kde-systemd-start-condition \
                     ${kdePackages.plasma-workspace}/bin/kde-systemd-start-condition
  '';

  nativeBuildInputs = [
    cmake
    kdePackages.extra-cmake-modules
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    kdePackages.kconfig
    kdePackages.kdbusaddons
    kdePackages.plasma-workspace
    kcgroups
  ];
})
