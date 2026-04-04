final: prev: {
  pyroveil = prev.stdenv.mkDerivation {
    pname = "pyroveil";
    version = "unstable-2025-03-01";

    src = prev.fetchgit {
      url = "https://github.com/HansKristian-Work/pyroveil.git";
      rev = "HEAD";
      fetchSubmodules = true;
      hash = "sha256-Ym9dTijzdYOKgHPya2dj+8/e1fJhTeUGKqszSeZ+PB4=";
    };

    nativeBuildInputs = with prev; [
      cmake
      ninja
      pkg-config
      git
      python3
    ];

    buildInputs = with prev; [
      vulkan-headers
      vulkan-loader
    ];

    cmakeFlags = [
      "-DCMAKE_BUILD_TYPE=Release"
      "-DCMAKE_CXX_FLAGS=-O1"
    ];

    meta = {
      description = "Vulkan layer that roundtrips shaders via SPIRV-Cross to fix NVIDIA driver bugs";
      homepage = "https://github.com/HansKristian-Work/pyroveil";
      license = prev.lib.licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };
}
