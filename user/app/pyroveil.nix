{ pkgs, ... }:

{
  home.packages = [ pkgs.pyroveil ];

  xdg.configFile."pyroveil/pyroveil.json".text = builtins.toJSON {
    version = 2;
    type = "pyroveil";
    matches = [
      {
        spirvExecutionModel = 5;
        action = {
          glsl-roundtrip = true;
        };
      }
    ];
    roundtripCache = "cache";
    disabledExtensions = [ "VK_NV_raw_access_chains" ];
  };
}
